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

  if $::osfamily == 'RedHat' {
    package {'policycoreutils-python':
      ensure => installed,
      notify => Exec['semanage /etc/prelink.cache'];
    }
  }
}
