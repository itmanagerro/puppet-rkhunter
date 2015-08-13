# Class: rkhunter::package
class rkhunter::package
{
  package
  {
    'rkhunter':
      ensure => latest
  }
  package
  {
    'prelink':
      ensure => latest
  }
}
