class hosts {


host { 'localhost':
  ensure       => 'present',
  host_aliases => ['localhost.localdomain', 'localhost4', 'localhost4.localdomain4', 'training.puppetlabs.vm', 'training'],
  ip           => '127.0.0.1',
  target       => '/etc/hosts',
}
host { 'console1.puppetlabs.vm':
  ensure       => 'present',
  host_aliases => ['console1'],
  ip           => '192.168.1.23',
  target       => '/etc/hosts',
}
host { 'console0.puppetlabs.vm':
  ensure       => 'present',
  host_aliases => ['console0'],
  ip           => '192.168.1.22',
  target       => '/etc/hosts',
}
host { 'master0.puppetlabs.vm':
  ensure       => 'present',
  host_aliases => ['master0'],
  ip           => '192.168.1.16',
  target       => '/etc/hosts',
}
host { 'master1.puppetlabs.vm':
  ensure       => 'present',
  host_aliases => ['master1'],
  ip           => '192.168.1.17',
  target       => '/etc/hosts',
}
host { 'puppetdb0.puppetlabs.vm':
  ensure       => 'present',
  host_aliases => ['puppetdb0'],
  ip           => '192.168.1.18',
  target       => '/etc/hosts',
}
host { 'puppetdb1.puppetlabs.vm':
  ensure       => 'present',
  host_aliases => ['puppetdb1'],
  ip           => '192.168.1.19',
  target       => '/etc/hosts',
}
host { 'puppet.puppetlabs.vm':
  ensure       => present,
  host_aliases => ['puppet','proxy','proxy.puppetlabs.vm'],
  ip           => '192.168.1.24',
  target       => '/etc/hosts',
}
host { 'pg0.puppetlabs.vm':
  ensure       => 'present',
  host_aliases => ['pg0'],
  ip           => '192.168.1.20',
  target       => '/etc/hosts',
}
host { 'agent0.puppetlabs.vm':
  ensure       => 'present',
  host_aliases => ['agent0'],
  ip           => '192.168.1.28',
  target       => '/etc/hosts',
}

  resources {'host':
    purge => true,
  }
}
