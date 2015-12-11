class profile::pulp_admin_client(
){
  package{[ 'pulp-admin-client',
            'pulp-puppet-admin-extensions',
            'pulp-rpm-admin-extensions' ]:
    require => Yumrepo['pulp-2-stable'],
    notify  => Service['httpd'],
  }
  file { '/etc/pulp/admin/admin.conf':
    source  => 'puppet:///modules/profile/pulp_admin_client/admin.conf',
    mode    => '0644',
    require => Package['pulp-admin-client'],
  }
}