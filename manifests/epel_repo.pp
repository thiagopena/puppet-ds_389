# Class ds389::epel_repo
class ds_389::epel_repo {

  yumrepo { 'EPEL7':
    baseurl  => 'https://dl.fedoraproject.org/pub/epel/7/x86_64/',
    descr    => 'EPEL 7 repository',
    enabled  => 1,
    gpgcheck => 0,
  }

}
