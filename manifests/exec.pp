# Class: rkhunter::exec
class rkhunter::exec {
  exec {
    'Prelink_All':
      command     => 'prelink --all', # Absolutelly needed for rkhunter to run properly
      path        => '/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin',
      subscribe   => File['/etc/rkhunter.conf'],
      notify      => Exec['RKHunter_Propupd'],
      before      => Exec['RKHunter_Update'],
      refreshonly => true;
    'RKHunter_Update':
      command     => 'rkhunter --update',
      path        => '/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin',
      tries       => 2, # It failes if there are updates after install, running it twice will make sure it's updated.
      subscribe   => Exec['Prelink_All'],
      before      => Exec['RKHunter_Propupd'],
      refreshonly => true;
    'RKHunter_Propupd':
      command     => 'rkhunter --propupd',
      path        => '/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin',
      subscribe   => Exec['RKHunter_Update'],
      before      => Exec['RKHunter_Scan'],
      refreshonly => true;
    'RKHunter_Scan':
      command     => 'rkhunter --cronjob --report-warnings-only',
      path        => '/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin',
      tries       => 2, # First try failes because of /etc/passwd and /etc/group files, which are added to database after first rkhunter scan
      require     => File[$rkhunter::configDefault],
      subscribe   => Exec['RKHunter_Propupd'],
      refreshonly => true;
  }

  if $::osfamily == 'RedHat' {
    exec { 'semanage /etc/prelink.cache':
      command     => 'semanage fcontext -a -t prelink_cron_system_exec_t /etc/prelink.cache;restorecon /etc/prelink.cache',
      path        => '/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin',
      require     => Package['policycoreutils-python'],
      before      => Exec['Prelink_All'],
      refreshonly => true;
    }
  }
}
