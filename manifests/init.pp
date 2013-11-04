class beuser (
  $ensure         = 'present',
  $package_name   = 'beuser',
  $adminfile      = undef,
  $provider       = undef,
  $source         = undef,
) {

  package { 'beuser':
    ensure    => $ensure,
    name      => $package_name,
    adminfile => $adminfile,
    provider  => $provider,
    source    => $source,
  }
}
