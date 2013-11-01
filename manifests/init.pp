class beuser (
  $ensure         = 'present',
  $package_name   = 'beuser',
  $adminfile      = undef,
  $provider       = undef,
  $source         = undef,
) {

  package { 'beuser':
    ensure => $ensure,
    name   => $package_name,
  }

  if $provider != undef {
    Package['beuser'] {
      provider => $provider,
    }
  }

  if $source != undef {
    Package['beuser'] {
      source => $source,
    }
  }

  if $adminfile != undef {
    Package['beuser'] {
      adminfile => $adminfile,
    }
  }
}
