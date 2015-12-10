class profile::pulp(
){
  yumrepo{ 'pulp-2-stable':
    descr    => 'Pulp 2 Stable',
    baseurl  => 'https://repos.fedorapeople.org/repos/pulp/pulp/stable/2/$releasever/$basearch/',
    gpgcheck => true,
    gpgkey   => 'https://repos.fedorapeople.org/repos/pulp/pulp/GPG-RPM-KEY-pulp-2',
  } ->
  package{[ 'python-gofer-qpid',
            'pulp-server',
            'pulp-puppet-plugins',
            'pulp-rpm-plugins',
            'pulp-selinux',
            'pulp-admin-client',
            'pulp-puppet-admin-extensions',
            'pulp-rpm-admin-extensions' ]:
    notify => Service['httpd'],
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
  file { '/etc/pulp/admin/admin.conf':
    source => 'puppet:///modules/profile/pulp/admin.conf',
    mode   => '0644',
    require => Package['pulp-admin-client'],
  }
}