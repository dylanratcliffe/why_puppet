#
class role::webserver {
  # This profile is equivelant to the "Package" example, it installs
  # Nginx with some very basic configuration
  include profile::nginx

  # This profile is like the "Config Files" example. It consists of
  # a website to host and the Nginx config required to set that up
  include profile::spacetime

  # This is the Monitoring example
  # include profile::monitoring_agent
}
