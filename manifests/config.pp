# Class: rkhunter::config
class rkhunter::config inherits rkhunter
{
  file {
    $rkhunter::config:
      ensure    => present,
      mode      => '0640',
      owner     => root,
      group     => root,
      path      => $rkhunter::config,
      show_diff => false,
      content   => template($rkhunter::configTemplate);

    $rkhunter::configDefault:
      ensure    => present,
      mode      => '0640',
      owner     => root,
      group     => root,
      path      => $rkhunter::configDefault,
      show_diff => false,
      before    => File[$rkhunter::config],
      content   => template($rkhunter::configDefaultTemplate);

    $rkhunter::basedir:
      ensure => directory,
      owner  => root,
      group  => root,
      before => File[$rkhunter::tmpdir];

    $rkhunter::tmpdir:
      ensure => directory,
      owner  => root,
      group  => root,
      before => File[$rkhunter::config];

    $rkhunter::prelink_config:
      ensure    => present,
      mode      => '0640',
      owner     => root,
      group     => root,
      path      => $rkhunter::prelink_config,
      show_diff => false,
      content   => template($rkhunter::prelink_configTemplate);
  }
}
