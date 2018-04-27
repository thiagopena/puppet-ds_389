![License](https://img.shields.io/badge/license-Apache%202-blue.svg)
# 389 Directory Server

#### Table of contents

1. [Overview](#overview)
2. [Supported Platforms](#supported-platforms)
3. [Requirements](#requirements)
4. [Installation](#installation)
5. [Usage](#usage)
6. [References](#references)
7. [Development](#development)

## Overview

This module will install and configure 389 Directory Server in your system.

## Supported Platforms

This module was tested under these platforms

- EL 6 and 7

Tested only in X86_64 arch.

## Requirements

- Puppet >= 5.3.3

## Installation

via git

    # cd /etc/puppetlabs/code/environment/production/modules
    # git clone https://github.com/thiagopena/puppet-ds_389.git ds_389

## Usage

### Quick run

    puppet apply -e "include ds_389"

## References

### Classes

```
ds_389
ds_389::install (private)
ds_389::config (private)
ds_389::service (private)
```

### Parameters type

#### `config_dir`

Type: String

Directory where 389 Directory Server store its configuration and working

#### `full_machine_name`

Type: String

Fully qualified domain name of the machine on which you are installing the server

#### `suite_spot_userid`

Type: String

User name as which the Directory Server instance runs

#### `suite_spot_group`

Type: String

Group as which the servers will run

#### `configdirectoryldapurl`

Type: String

LDAP URL that is used to connect to your configuration directory

#### `admindomain`

Type: String

Administration domain under which this Directory Server instance is registered

#### `configdirectoryadminid`

Type: String

User ID of the user that has administration privileges to the configuration directory

#### `configdirectoryadminpwd`

Type: String

Password for the admin user

#### `serverport`

Type: String

Port the server will use for LDAP connections

#### `serveridentifier`

Type: String

Server identifier. This value is used as part of the name of the directory in which the Directory Server instance is installed

#### `suffix`

Type: String

Suffix under which to store the directory data

#### `rootdn`

Type: String

Distinguished name used by the Directory Manager

#### `rootdnpwd`

Type: String

Directory Manager's password

#### `addorgentries`

Type: String

If yes, this directive creates the new Directory Server instance with a suggested directory structure and access control

#### `addsampleentries`

Type: String

Sets whether to load an LDIF file with entries for the user directory during configuration

#### `installldiffile`

Type: String

Populates the new directory with the contents of the specified LDIF file

#### `schemafile`

Type: String

Lists the full path and file name of additional schema files

#### `configfile`

Type: String

Lists the full path and file name of additional configuration to add to the new dse.ldif

#### `ds_bename`

Type: String

Sets the database name to use for the user database

#### `slapdconfigformc`

Type: String

Sets whether to store the configuration data in the new Directory Server instance

#### `useexistingmc`

Type: String

Sets whether to store the configuration data in a separate Configuration Directory Server

#### `sysuser`

Type: String

User as which the Admin Server will run

#### `port`

Type: String

Port that the Admin Server will use

#### `serveradminid`

Type: String

Administration ID that can be used to access this Admin Server if the configuration directory is not responding

#### `serveradminpwd`

Type: String

Password for the Admin Server user

#### `serveripaddress`

Type: String

IP address on which the Admin Server will listen

#### `service_name`

Type: String

Name for 389 Directory Server service

#### `admin_service_name`

Type: String

Name for Admin Server service


## Development

### My dev environment

This module was developed using

- Puppet 5.3.3
  - Hiera 3.4.2 (v5 format)
  - Facter 2.5.1
- CentOS 7.3
- Vagrant 2.0.1 + VirtualBox 5.2.8
  - box: centos/7

### Author/Contributors

Thiago Pena
