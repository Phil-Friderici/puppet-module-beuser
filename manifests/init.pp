# == Class: beuser
#
# Manage beuser
#
class beuser (
  $ensure         = 'present',
  $package_name   = 'beuser',
  $adminfile      = undef,
  $provider       = undef,
  $source         = undef,
) {

  # validate params
  if $adminfile != undef {
    validate_absolute_path($adminfile)
  }

  if $provider != undef {
    validate_re($provider, '^[a-zA-Z0-9]+[a-zA-Z0-9_]+$', "beuser::provider is <${provider}>, which does not match regex for an acceptable name.")
  }

  if $source != undef {
    validate_absolute_path($source)
  }

  package { 'beuser':
    ensure    => $ensure,
    name      => $package_name,
    adminfile => $adminfile,
    provider  => $provider,
    source    => $source,
  }
}
