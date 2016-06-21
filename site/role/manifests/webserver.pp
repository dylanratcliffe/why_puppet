#
class role::webserver {
  include profile::nginx
  include profile::spacetime
  include profile::monitoring_agent
}
