class role::pulp_server(
){
  include profile::swap
  include profile::web
  include profile::epel
  include profile::mongodb
  include profile::qpid
  include profile::pulp_yum_repo
  include profile::pulp_server
  include profile::pulp_admin_client
}