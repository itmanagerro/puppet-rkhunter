puppet-rkhunter
===============
Manage rkhunter installation and configuration with Puppet.

[![Build Status](https://img.shields.io/travis/itmanagerro/puppet-rkhunter.svg?style=plastic)](https://travis-ci.org/itmanagerro/puppet-rkhunter)
[![Score Status](https://img.shields.io/puppetforge/f/itmanagerro/rkhunter.svg?style=plastic)](https://forge.puppetlabs.com/itmanagerro/rkhunter/scores)
[![Downloads Status](https://img.shields.io/puppetforge/dt/itmanagerro/rkhunter.svg?style=plastic)](https://forge.puppetlabs.com/itmanagerro/rkhunter)
[![Version Status](https://img.shields.io/puppetforge/v/itmanagerro/rkhunter.svg?style=plastic)](https://forge.puppetlabs.com/itmanagerro/rkhunter/changelog)
[![Endorsement Status](https://img.shields.io/puppetforge/e/itmanagerro/rkhunter.svg?style=plastic)](https://forge.puppetlabs.com/itmanagerro/puppet-rkhunter)

[![Modules Count](https://img.shields.io/puppetforge/mc/itmanagerro.svg?style=plastic)](https://forge.puppetlabs.com/itmanagerro)
[![Release Count](https://img.shields.io/puppetforge/rc/itmanagerro.svg?style=plastic)](https://forge.puppetlabs.com/itmanagerro)

## Features
- Manage all configuration entries
- Prelinking, updating, propupdating and scanning after configuration change
- Working without any configuration changes (mostly with no warnings)
- Setting daily scan and weekly update cron jobs
- Manage scriptWhiteList for possible whitelisting (TODO: 50%)
- Specify type (string, array, bool) of each parameter (TODO: 25%)

## Supported OS
I have tested the module on all these machines:

- CentOS:
  - 6.6 (Final)
  - 6.7 (Final)
- Debian:
  - 6.0.10 (Squeeze)
  - 7.8 (Wheezy)
  - 8.1 (Jessie)

It should work on any Redhat or Debian based operating systems.

If you need any other operating systems tested, please [let me know](https://github.com/itmanagerro/puppet-rkhunter/issues/new).

I will use your requests for creating rspec for specific operating system.

## Configuration
This module should require nothing more than [minimal configuration](#minimal-configuration).

If you need aditional features or if you have any issues, please [contact me](https://github.com/itmanagerro/puppet-rkhunter/issues/new).
### Minimal configuration
```
class
{
  'rkhunter':
    mail_on_warning => 'john.doe@anonymous.domain',
}
```

### A more complex configuration
```
class
{
  'rkhunter':
    allow_ssh_root_user     => 'yes',
    append_log              => 1,
    allow_syslog_remote_log => 1,
    shared_lib_whitelist    =>
    [
      '/lib/snoopy.so'
    ],
    scriptwhitelist         =>
    [ 
      '/bin/egrep',
      '/bin/fgrep',
      '/usr/bin/ldd',
      '/usr/bin/lwp-request',
      '/usr/sbin/adduser',
      '/usr/bin/unhide.rb',
    ],
}
```
### Full List of optional configuration parameters:

```
allowdevfile
allowhiddendir
allowhiddenfile
allowprocdelfile
allowproclisten
allowpromiscif
allow_ssh_prot_v1
allow_ssh_root_user
allow_syslog_remote_logging
append_log
app_whitelist
apt_autogen
attrwhitelist
auto_x_detect
bindir
color_set2
config
configTemplate
configDefault
configDefaultTemplate
copy_log_on_error
cron_daily_run
cron_weekly_run
cron_db_update
dbdir
db_update_email
diag_scan
disable_tests
empty_logfiles
enable_tests
epoch_date_cmd
exclude_user_fileprop_files_dirs
existwhitelist
hash_cmd
hash_fld_idx
ignore_prelink_dep_err
immutable_set
immutwhitelist
inetd_allowed_svc
inetd_conf_path
installdir
language
lock_timeout
logfile
mail_cmd
mail_on_warning
mirrors_mode
missing_logfiles
modules_dir
nice
os_version_file
password_file
phalanx2_dirtest
pkgmgr
pkgmgr_no_vrfy
port_path_whitelist
port_whitelist
pwdless_accounts
readlink_cmd
rotate_mirrors
rtkt_dir_whitelist
rtkt_file_whitelist
run_check_on_battery
scan_mode_dev
scanrootkitmode
scriptdir
scriptwhitelist
shared_lib_whitelist
show_lock_msgs
show_summary_time
show_summary_warnings_number
ssh_config_dir
startup_paths
stat_cmd
suspscan_dirs
suspscan_maxsize
suspscan_temp
suspscan_thresh
syslog_config_file
tmpdir
uid0_accounts
unhidetcp_opts
unhide_tests
update_lang
update_mirrors
updt_on_os_change
use_locking
user_fileprop_files_dirs
use_sunsum
use_syslog
warn_on_os_change
web_cmd
whitelisted_is_white
writewhitelist
xinetd_allowed_svc
xinetd_conf_path
```

Copyright 2015 [Mihai Cornateanu @ ITManager](http://www.itmanager.ro)
