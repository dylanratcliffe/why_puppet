#
class profile::load_balancer {
  # Set up the haproxy load balancer
  class { '::haproxy':
    global_options => {
      'user'  => 'root',
      'group' => 'root',
    },
  }

  # Create the load balancing pool
  haproxy::listen { 'spacetime':
    collect_exported => true,
    ipaddress        => $::ipaddress,
    ports            => '80',
  }

  # Make the Puppet agent run really often
  ini_setting { 'puppet_run_frequency':
    ensure  => present,
    path    => '/etc/puppetlabs/puppet/puppet.conf',
    section => 'agent',
    setting => 'runinterval',
    value   => '30s',
    notify  => Service['puppet'],
  }

  service { 'puppet':
    ensure => running,
  }
}
