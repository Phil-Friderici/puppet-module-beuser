class beuser(
  $ensure  = 'present',
  $srcdir  = '/opt/eis_cm_repos/eis_cm_repo/beuser',
  $dstdir  = '/bin',
  $binname = 'beuser',
  $mode    = '4755',
  $owner   = 'root',
  $group   = 'root',
) {

  case $::osfamily {
    'Solaris' : {
      case $::operatingsystemrelease {
        /(^5.1[01])|(^10)/ : {
          if $::hardwareisa == 'sparc' {
            $suffix = 'sol10sparc'
          } else {
            $suffix = 'sol10x64'
          }
        }
        /^9/ : {
          if $::hardwareisa == 'sparc' {
            $suffix = 'sol10sparc'
          } else {
            $suffix = 'sol10x64'
          }
        }
        default : {
          warning( "Solaris ${::operatingsystemrelease} is not supported by module beuser" )
        }
      }
    }
    'Suse' : {
      case $::operatingsystemrelease {
        /^10/ : {
          if $::architecture == 'x86_64' {
            $suffix = 'sles10x64'
          } else {
            $suffix = 'sles10i386'
          }
        }
        /^11/ : {
          if $::architecture == 'x86_64' {
            $suffix = 'sles11x64'
          } else {
            $suffix = 'sles11i386'
          }
        }
        /^9/ : {
          if $::architecture == 'x86_64' {
            $suffix = 'sles9x64'
          } else {
            $suffix = 'sles9i386'
          }
        }
        default : {
          warning( "${::operatingsystem} ${::operatingsystemrelease} is not supported by module beuser" )
        }
      }
    }
    'RedHat' : {
      case $::operatingsystemrelease {
        /^5/ : {
          if $::architecture == 'x86_64' {
            $suffix = 'rhl5x64'
          } else {
            $suffix = 'rhl5i386'
          }
        }
        /^6/ : {
          if $::architecture == 'x86_64' {
            $suffix = 'rhl6x64'
          } else {
            $suffix = 'rhl6i386'
          }
        }
        default : {
          warning( "${::operatingsystem} ${::operatingsystemrelease} is not supported by module beuser" )
        }
      }
    }
    'Debian' : {
      case $::operatingsystemrelease {
        '12.04' : {
          if $::architecture == 'x86_64' {
            $suffix = 'ubuntu1204x64'
          } else {
            warning( "${::operatingsystem} ${::operatingsystemrelease} with architecture ${::architecture} is not supported by module beuser" )
          }
        }
        default : {
          warning( "${::operatingsystem} ${::operatingsystemrelease} is not supported by module beuser" )
        }
      }
    }
    default : {
      fail( "OS is not supported by module beuser" )
    }
  }

  if $suffix != undef {
    file { 'beuser' :
      ensure => $ensure,
      path => "${dstdir}/${binname}",
      source => "${srcdir}/${binname}.${suffix}",
      mode   => $mode,
      owner  => $owner,
      group  => $group,
    }
  }
}
