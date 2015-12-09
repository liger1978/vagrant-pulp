class profile::web(
){
  package{'httpd':} ->
  service{'httpd':
    ensure  => 'running',
    enable  => true,
  }
  firewall { '100 allow http and https access':
    dport   => [80, 443],
    proto  => tcp,
    action => accept,
  }
}