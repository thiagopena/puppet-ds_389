# ds_389 class.
#
# This is a class to install and manage 389 Directory Server:
#
# @example Declaring the class
#   include ds_389
#
# @param [String] config_dir Directory where 389 Directory Server store its configuration and working
# @param [String] full_machine_name Fully qualified domain name of the machine on which you are installing the server
# @param [String] suite_spot_userid User name as which the Directory Server instance runs
# @param [String] suite_spot_group Group as which the servers will run
# @param [String] configdirectoryldapurl LDAP URL that is used to connect to your configuration directory
# @param [String] admindomain Administration domain under which this Directory Server instance is registered
# @param [String] configdirectoryadminid User ID of the user that has administration privileges
#       to the configuration directory
# @param [String] configdirectoryadminpwd Password for the admin user
# @param [Integer] serverport Port the server will use for LDAP connections
# @param [String] serveridentifier Server identifier
# @param [String] suffix Suffix under which to store the directory data
# @param [String] rootdn Distinguished name used by the Directory Manager
# @param [String] rootdnpwd  Directory Manager's password
# @param [String] addorgentries If yes, this directive creates the new Directory Server instance with a
#       suggested directory structure and access control
# @param [String] addsampleentries Sets whether to load an LDIF file with entries for the user directory
#       during configuration
# @param [String] installldiffile Populates the new directory with the contents of the specified LDIF file
# @param [String] schemafile Lists the full path and file name of additional schema files
# @param [String] configfile Lists the full path and file name of additional configuration to add to the new dse.ldif
# @param [String] ds_bename Sets the database name to use for the user database
# @param [String] slapdconfigformc Sets whether to store the configuration data in the new Directory Server instance
# @param [String] useexistingmc Sets whether to store the configuration data in a separate
#       Configuration Directory Server
# @param [String] sysuser User as which the Admin Server will run
# @param [Integer] port Port that the Admin Server will use
# @param [String] serveradminid Administration ID that can be used to access this Admin Server
#       if the configuration directory is not responding
# @param [String] serveradminpwd Password for the Admin Server user
# @param [String] serveripaddress IP address on which the Admin Server will listen
# @param [String] service_name Name for 389 Directory Server service
# @param [String] admin_service_name Name for Admin Server service

class ds_389(
    String $config_dir              = '/etc/dirsrv',

    String $full_machine_name       = $::fqdn,
    String $suite_spot_userid       = 'dirsrv',
    String $suite_spot_group        = 'dirsrv',
    String $configdirectoryldapurl  = "ldap://${::fqdn}:389/o=netscaperoot",
    String $admindomain             = 'example.com',
    String $configdirectoryadminid  = 'admin',
    String $configdirectoryadminpwd = 'secretpass',

    Integer $serverport             = 389,
    String $serveridentifier        = 'ldap',
    String $suffix                  = 'dc=example,dc=com',
    String $rootdn                  = 'cn=Directory Manager',
    String $rootdnpwd               = 'secretpass',
    String $addorgentries           = 'yes',
    String $addsampleentries        = 'yes',
    String $installldiffile         = 'suggest',
    String $schemafile              = '',
    String $configfile              = '',
    String $ds_bename               = 'exampleDB',
    String $slapdconfigformc        = 'yes',
    String $useexistingmc           = 'no',

    String $sysuser                 = 'dirsrv',
    Integer $port                   = 9830,
    String $serveradminid           = 'admin',
    String $serveradminpwd          = 'secretpass',
    String $serveripaddress         = $::ipaddress,

    String $service_name            = 'dirsrv',
    String $admin_service_name      = 'dirsrv-admin',
    Boolean $manage_epel_repo       = false,
){

    include ds_389::install
    include ds_389::config
    include ds_389::service

    if $ds_389::manage_epel_repo {
      include ds_389::epel_repo
      Class['ds_389::epel_repo']
        -> Class['ds_389::install']
    }

    Class['ds_389::install']
      -> Class['ds_389::config']
        ~> Class['ds_389::service']

}
