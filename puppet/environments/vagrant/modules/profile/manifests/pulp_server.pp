class profile::pulp_server(
){
  package{[ 'python-gofer-qpid',
            'pulp-server',
            'pulp-puppet-plugins',
            'pulp-rpm-plugins',
            'pulp-selinux' ]:
    require => Yumrepo['pulp-2-stable'],
    notify  => Service['httpd'],
  }
  exec { 'pulp-manage-db':
    command     => '/bin/sudo -u apache /bin/pulp-manage-db',
    subscribe   => Package['pulp-server'],
    refreshonly => true,
  }
  service { 'pulp_workers':
    ensure    => 'running',
    enable    => true,
    require   => [Package['pulp-server'],
                  Service['httpd'],],
    subscribe => Exec['pulp-manage-db'],
  }
  service { 'pulp_celerybeat':
    ensure    => 'running',
    enable    => true,
    require   => [Package['pulp-server'],
                  Service['httpd'],],
    subscribe => Exec['pulp-manage-db'],
  }
  service { 'pulp_resource_manager':
    ensure    => 'running',
    enable    => true,
    require   => [Package['pulp-server'],
                  Service['httpd'],],
    subscribe => Exec['pulp-manage-db'],
  }
}