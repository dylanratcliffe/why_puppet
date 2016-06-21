#
class profile::nginx {
  stage { 'repositories':
    before => Stage['main'],
  }

  if $::os['family'] == 'RedHat' {
    class { '::epel':
      stage => 'repositories',
    }
  }
  elsif $::os['family'] == 'Debian' {
    class { '::apt':
      stage => 'repositories',
    }
  }

  include ::nginx

  file { '/var/www':
    ensure => 'directory',
    owner  => 'nginx',
    group  => 'nginx',
    mode   => '0755',
  }
}
