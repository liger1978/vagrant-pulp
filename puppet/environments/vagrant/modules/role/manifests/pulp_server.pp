class role::pulp_server(
){
  include profile::utils
  include profile::web
  include profile::epel
  include profile::mongodb
  include profile::qpid
  include profile::pulp
}