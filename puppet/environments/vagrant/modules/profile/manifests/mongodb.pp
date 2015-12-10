class profile::mongodb(
){
  package{'mongodb-server':
    require => Yumrepo['epel-7'],
  } ->
  service{'mongod':
    ensure => 'running',
    enable => true,
  }
}