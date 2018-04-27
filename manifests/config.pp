# Configures the Directory Server 389 service
class ds_389::config {

  group { $ds_389::suite_spot_group:
    ensure => present,
  }

  user { $ds_389::suite_spot_userid:
    ensure => present,
    groups => [$ds_389::suite_spot_group, 'root'],
    home   => "/home/${ds_389::config_dir}",
  }

  file { $ds_389::config_dir:
    ensure => directory,
  }

  file { "${ds_389::config_dir}/setup.inf":
    content => epp('ds_389/setup.inf.epp'),
    owner   => $ds_389::suite_spot_userid,
    group   => $ds_389::suite_spot_group,
    mode    => '0660',
  }

  exec { 'setup_ds_admin':
    command => "setup-ds-admin.pl -s -f ${ds_389::config_dir}/setup.inf",
    path    => ['/bin', '/sbin', '/usr/bin', '/usr/sbin'],
    require => [File["${ds_389::config_dir}/setup.inf"], Package[$ds_389::install::package]],
    creates => "${ds_389::config_dir}/slapd-${ds_389::serveridentifier}",
  }

  exec { 'setup_ds_admin_update':
    command     => 'setup-ds-admin.pl -u',
    path        => ['/bin', '/sbin', '/usr/bin', '/usr/sbin'],
    require     => Exec['setup_ds_admin'],
    refreshonly => true,
  }

}
