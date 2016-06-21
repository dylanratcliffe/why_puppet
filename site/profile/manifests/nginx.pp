#
class profile::nginx {
  # Set up our repositories before we do anything else
  stage { 'repositories':
    before => Stage['main'],
  }

  # Make sure we use the correct classes based on OS
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

  # Install Nginx
  include ::nginx

  # Create dircetory for websites to live in
  file { '/var/www':
    ensure => 'directory',
    owner  => 'nginx',
    group  => 'nginx',
    mode   => '0755',
  }
}
