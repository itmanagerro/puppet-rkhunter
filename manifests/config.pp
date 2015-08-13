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

    $rkhunter::tmpdir:
      ensure => directory,
      owner  => root,
      group  => root,
      before => File[$rkhunter::config]
  }
}
