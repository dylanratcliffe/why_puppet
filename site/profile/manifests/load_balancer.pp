#
class profile::load_balancer {
  class { '::haproxy':
    global_options => {
      'user'  => 'root',
      'group' => 'root',
    },
  }

  haproxy::listen { 'spacetime':
    collect_exported => true,
    ipaddress        => $::ipaddress,
    ports            => '80',
  }
}
