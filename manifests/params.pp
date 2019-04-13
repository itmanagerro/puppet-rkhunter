# Class: rkhunter::params
class rkhunter::params
{
  $allowdevfile =
  [
    '/dev/shm/pulse-shm-*',
    '/dev/md/md-device-map',
    '/dev/shm/PostgreSQL.*',
    '/dev/.udev/queue.bin',
    '/dev/.udev/db/block*',
    '/dev/.udev/db/input*',
    '/dev/.udev/db/net*',
    '/dev/.udev/db/serio*',
    '/dev/.udev/rules.d/99-root.rules',
  ]
  $allowhiddendir =
  [
    '/dev/.udev',
    '/dev/.udevdb',
    '/etc/.java',
    '/dev/.mdadm',
    '/usr/bin/(null)/.cache',
  ]
  $allowhiddenfile =
  [
    '/usr/share/man/man5/.k5identity.5.gz',
    '/usr/share/man/man5/.k5login.5.gz',
    '/usr/bin/.ssh.hmac',
    '/usr/bin/.fipscheck.hmac',
    '/usr/sbin/.sshd.hmac',
    '/usr/share/man/man1/..1.gz',
  ]
  $allowprocdelfile =
  [
    '/usr/sbin/mysqld:/tmp/ib*',
    '/usr/lib/apache2/mpm-itk/apache2:/var/run/apache2/ssl_mutex',
    '/usr/lib/apache2/mpm-prefork/apache2:/run/apache2/ssl_mutex',
    '/usr/lib/dovecot/imap-login:/run/dovecot/login-master-notify*',
    '/usr/sbin/dovecot:/run/dovecot/login-master-notify*',
    '/root/exe:/run/apache2/ssl_mutex',
    '/usr/sbin/php5-fpm:/tmp/.xcache.*',
    '/usr/bin/php5-cgi:/tmp/.xcache.*',
    '/usr/bin/python2.7:/var/log/mailman/error.1',
    'apache2:/run/apache2/ssl_mutex',
    '/bin/bash',
    '/sbin/agetty',
    '/sbin/rpcbind',
    '/sbin/rpc.statd',
    '/sbin/udevd',
    '/usr/bin/dbus-daemon',
    '/usr/bin/freshclam',
    '/usr/bin/nodejs',
    '/usr/bin/perl.#prelink#',
    '/usr/bin/screen',
    '/usr/lib/gamin/gam_server',
    '/usr/sbin/clamd',
    '/usr/sbin/cron',
    '/usr/sbin/ntpd',
    '/usr/sbin/php5-fpm',
    '/usr/sbin/rpc.idmapd',
    '/usr/sbin/rsyslogd',
  ]
  $allowproclisten =
  [
    '/sbin/dhclient',
    '/usr/bin/dhcpcd',
    '/usr/sbin/tcpdump',
    '/usr/sbin/snort-plain'
  ]
  $allowpromiscif = undef
  $allow_ssh_prot_v1 = 0
  $allow_ssh_root_user = 'yes'
  $allow_syslog_remote_logging = 0
  $append_log = 0
  $app_whitelist =
  [
    'openssl:1.0.1e',
    'httpd:2.2.15',
    'gpg:1.4.12',
    'sshd:6.0p1',
  ]
  $apt_autogen = true
  $attrwhitelist = undef
  $auto_x_detect = 1
  $bindir = undef
  $color_set2 = 0
  $config = '/etc/rkhunter.conf'
  $configDefault = $::operatingsystem ?
  {
    'CentOS'      => '/etc/sysconfig/rkhunter',
    'Debian'      => '/etc/default/rkhunter',
    'OracleLinux' =>'/etc/sysconfig/rkhunter',
    default       => fail("${::operatingsystem} is not supported")
  }
  $configDefaultTemplate = 'rkhunter/etc/rkhunter.default.erb'
  $configTemplate = 'rkhunter/etc/rkhunter.conf.erb'
  $copy_log_on_error = 0
  $cron_daily_run = true
  $cron_db_update = true
  $cron_weekly_run = true
  $dbdir = '/var/lib/rkhunter/db'
  $db_update_email = false
  $diag_scan = 'yes'
  $disable_tests = $::virtual ?
  {
    /(xenhvm|openvz)/ =>
      [
        'avail_modules',
        'loaded_modules',
        'suspscan',
        'hidden_ports',
        'hidden_procs',
        'deleted_files',
        'packet_cap_apps'
      ],
    default  =>
      [
        'suspscan',
        'hidden_ports',
        'hidden_procs',
        'deleted_files',
        'packet_cap_apps'
      ]
  }
  $empty_logfiles = undef
  $enable_tests = ['all']
  $epoch_date_cmd = 'PERL'
  $exclude_user_fileprop_files_dirs = undef
  $existwhitelist =
  [
    '/usr/bin/whatis',
  ]
  $hash_cmd = undef
  $hash_fld_idx = 1
  $ignore_prelink_dep_err = undef
  $immutable_set = 0
  $immutwhitelist = undef
  $inetd_allowed_svc = undef
  $inetd_conf_path = undef
  $installdir = '/usr'
  $language = 'en'
  $lock_timeout = 300
  $logfile = '/var/log/rkhunter.log'
  $mail_cmd = "mail -s \'[rkhunter] Warnings found on machine: ${::fqdn}\'"
  $mail_on_warning = ['root@localhost']
  $mirrors_mode = 0
  $missing_logfiles = undef
  $modules_dir = undef
  $nice = '10'
  $os_version_file = undef
  $password_file = undef
  $phalanx2_dirtest = 0
  $pkgmgr = $::operatingsystem ?
  {
    'CentOS'      => 'RPM',
    'Debian'      => 'DPKG',
    'OracleLinux' => 'RPM',
    default       => 'none'
  }
  $pkgmgr_no_vrfy = undef
  $port_path_whitelist = undef
  $port_whitelist = undef
  $pwdless_accounts = undef
  $readlink_cmd = undef
  $rotate_mirrors = 1
  $rtkt_dir_whitelist = undef
  $rtkt_file_whitelist = undef
  $run_check_on_battery = false
  $scan_mode_dev = 'THOROUGH'
  $scanrootkitmode = undef
  $scriptdir = '/usr/share/rkhunter/scripts'
  $scriptwhitelist =
  [
    '/sbin/ifdown',
    '/sbin/ifup',
    '/usr/bin/ldd',
    '/usr/sbin/adduser',
    '/usr/bin/whatis'
  ]
  $shared_lib_whitelist = undef
  $show_lock_msgs = 1
  $show_summary_time = undef
  $show_summary_warnings_number = undef
  $ssh_config_dir = undef
  $startup_paths = undef
  $stat_cmd = undef
  $suspscan_dirs =
  [
    '/tmp',
    '/var/tmp'
  ]
  $suspscan_maxsize = 1024000
  $suspscan_temp = '/dev/shm'
  $suspscan_thresh = 200
  $syslog_config_file = undef
  $tmpdir = '/var/lib/rkhunter/tmp'
  $uid0_accounts = undef
  $unhidetcp_opts = undef
  $unhide_tests = 'sys'
  $update_lang = undef
  $update_mirrors = 1
  $updt_on_os_change = 0
  $use_locking = 0
  $user_fileprop_files_dirs = undef
  $use_sunsum = 'NONE'
  $use_syslog = 'authpriv.notice'
  $warn_on_os_change = 1
  $web_cmd = undef
  $whitelisted_is_white = 1
  $writewhitelist = undef
  $xinetd_allowed_svc = undef
  $xinetd_conf_path = undef
}
