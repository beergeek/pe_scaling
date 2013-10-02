class pe_scaling::pre_console {

  $before_db = false
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
    ensure => file,
    source => 'puppet:///modules/pe_scaling/routes.yaml',
  }

  service {'pe-httpd':
    ensure    => running,
    enable    => true,
    subscribe => [File['/etc/puppetlabs/puppet/puppet.conf'],File['/etc/puppetlabs/puppet/routes.yaml']],
  }
}
