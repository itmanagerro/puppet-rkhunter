# Class: rkhunter::cron
class rkhunter::cron inherits rkhunter
{
  file
  {
    '/etc/cron.daily/rkhunter':
      ensure    => present,
      require   => Package['rkhunter'],
      mode      => '0744',
      show_diff => false,
      content   => template('rkhunter/etc/rkhunter.cron.erb')
  }
  file
  {
    '/etc/cron.weekly/rkhunter':
      ensure    => present,
      require   => Package['rkhunter'],
      mode      => '0744',
      show_diff => false,
      content   => template('rkhunter/etc/rkhunter.update.erb')
  }
}
