#
class role::webserver {
  include profile::nginx
  include profile::spacetime
}
