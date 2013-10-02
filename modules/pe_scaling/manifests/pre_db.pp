class pe_scaling::pre_db {

  $before_db = true
  $before_console = true

  File {
    owner => pe-puppet,
    group => pe-puppet,
    mode  => 0644,
  }

  file {'/etc/puppetlabs/puppet/puppet.conf':
    ensure  => file,
    content => template('pe_scaling/puppet.conf.erb'),
  }

  file {'/etc/puppetlabs/puppet/routes.yaml':
    ensure => absent,
  }

  service {'pe-httpd':
    ensure    => running,
    enable    => true,
    subscribe => [File['/etc/puppetlabs/puppet/puppet.conf'],File['/etc/puppetlabs/puppet/routes.yaml']],
  }
}
