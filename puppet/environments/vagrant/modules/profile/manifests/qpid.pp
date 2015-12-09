class profile::qpid(
){
  package{[ 'qpid-cpp-server',
            'qpid-tools',
            'python-qpid',
            'python-qpid-qmf' ]:
    require => Yumrepo['epel-7'],
  } ->
  service{'qpidd':
    ensure  => 'running',
    enable  => true,
  }
}