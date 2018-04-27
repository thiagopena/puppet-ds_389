# Class ds389::service
class ds_389::service {

  service { "${ds_389::service_name}.target":
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
  }

  service { $ds_389::admin_service_name:
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
  }

}
