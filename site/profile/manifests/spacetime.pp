#
class profile::spacetime {
  File {
    owner => 'nginx',
    group => 'nginx',
    mode  => '0644',
  }

  file { '/var/www/spacetime':
    ensure => directory,
  }

  file { '/var/www/spacetime/index.html':
    ensure => file,
    source => 'puppet:///modules/profile/index.html',
  }

  nginx::resource::vhost { 'spacetime':
    www_root => '/var/www/spacetime',
  }
}
