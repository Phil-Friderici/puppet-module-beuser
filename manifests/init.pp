class beuser (
  $ensure         = 'present',
  $package_name   = 'beuser',
) {

  package { 'beuser':
    ensure  => $ensure,
    name    => $package_name,
  }
}
