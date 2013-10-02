class profile::rsyncd {

  package {'xinetd':
    ensure => present,
  }

  service {'xinetd':
    ensure  => running,
    enable  => true,
    require => Package['xinetd'],
  }
}
