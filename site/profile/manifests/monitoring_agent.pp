#
class profile::monitoring_agent {
  # Install the monitoring agent
  class { '::collectd':
    purge_config => true,
    interval     => '5',
  }

  # Install the plugins
  include ::collectd::plugin::syslog
  include ::collectd::plugin::cpu
  include ::collectd::plugin::memory
  include ::collectd::plugin::interface
  include ::collectd::plugin::df

  # Set up the location it should be writing its data to
  collectd::plugin::write_graphite::carbon {'my_graphite':
    graphitehost   => 'metrics.mycompany.com',
    graphiteport   => 2003,
    graphiteprefix => '',
    protocol       => 'tcp'
  }
}
