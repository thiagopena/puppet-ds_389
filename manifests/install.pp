# Installs the Directory Server 389 package
class ds_389::install {

  case $::osfamily {
    'RedHat': {
      $package = ['389-ds', '389-ds-base',]
    }
    default: {
      fail("${::operatingsystem} not supported.")
    }
  }

  package { $package:
    ensure => present,
    notify => Exec['setup_ds_admin_update'],
  }

}
