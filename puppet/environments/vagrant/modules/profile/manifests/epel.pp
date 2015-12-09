class profile::epel(
){
  yumrepo{ 'epel-7':
    descr      => 'EPEL 7',
    mirrorlist => 'https://mirrors.fedoraproject.org/metalink?repo=epel-7&arch=$basearch',
    gpgcheck   => true,
    gpgkey     => 'https://dl.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-7'
  }
}