class profile::pulp_yum_repo(
){
  yumrepo{ 'pulp-2-stable':
    descr    => 'Pulp 2 Stable',
    baseurl  => 'https://repos.fedorapeople.org/repos/pulp/pulp/stable/2/$releasever/$basearch/',
    gpgcheck => true,
    gpgkey   => 'https://repos.fedorapeople.org/repos/pulp/pulp/GPG-RPM-KEY-pulp-2',
  }
}