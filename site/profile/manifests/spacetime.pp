#
class profile::spacetime {
  File {
    owner => 'nginx',
    group => 'nginx',
    mode  => '0644',
  }

  # Create directory for the website to live in
  file { '/var/www/spacetime':
    ensure => directory,
  }

  # Write a simple html page
  file { '/var/www/spacetime/index.html':
    ensure => file,
    source => 'puppet:///modules/profile/index.html',
  }

  # Configure Nginx to host the website
  nginx::resource::vhost { 'spacetime':
    www_root => '/var/www/spacetime',
  }
}
