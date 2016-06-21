#
class profile::spacetime {
  file { '/var/www/spacetime':
    ensure => directory,
    owner  => 'nginx',
    group  => 'nginx',
    mode   => '0755',
  }

  file { '/var/www/spacetime/index.html':
    ensure => file,
    owner  => 'nginx',
    group  => 'nginx',
    mode   => '0644',
    source => 'puppet:///modules/profile/index.html',
  }

  nginx::resource::vhost { 'spacetime':
    ssl      => true,
    www_root => '/var/www/spacetime',
  }
}
