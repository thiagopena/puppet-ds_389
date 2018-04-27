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

  yumrepo { 'EPEL7':
    baseurl  => 'https://dl.fedoraproject.org/pub/epel/7/x86_64/',
    descr    => 'EPEL 7 repository',
    enabled  => 1,
    gpgcheck => 0,
  }

  package { $package:
    ensure  => present,
    require => Yumrepo['EPEL7'],
    notify  => Exec['setup_ds_admin_update'],
  }

}
