class role::proxy {

  include profile::base
  include apache
  include apache::mod::ssl
  include apache::mod::proxy
  include apache::mod::proxy_http
  #include apache::mod::proxy_html
  apache::vhost {'puppet':
    servername     => 'puppet.puppetlabs.vm',
    docroot        => '/var/www/puppet',
    port           => '8140',
    ssl            => true,
    sslproxyengine => true,
    #proxy_pass     => [{'path' => '/','url' => 'balancer://puppet00/'}],
    ssl_cert       => '/etc/puppetlabs/puppet/ssl/certs/puppet.puppetlabs.vm.pem',
    ssl_key        => '/etc/puppetlabs/puppet/ssl/private_keys/puppet.puppetlabs.vm.pem',
    ssl_chain      => '/etc/puppetlabs/puppet/ssl/certs/ca.pem',
    ssl_ca         => '/etc/puppetlabs/puppet/ssl/certs/ca.pem',
    request_headers => [
      'set X-SSL-Subject %{SSL_CLIENT_S_DN}e',
      'set X-Client-DN %{SSL_CLIENT_S_DN}e',
      'set X-Client-Verify %{SSL_CLIENT_VERIFY}e',
    ],
    custom_fragment => '
    ProxyRequests off
    <Proxy *>
      Order deny,allow
      Allow from all
    </Proxy>
    ProxyPassMatch ^/([^/]+/certificate.*)$ https://master0.puppetlabs.vm:8140/$1
    ProxyPass        / balancer://puppet00/
    ProxyPassReverse / balancer://puppet00/
    ProxyPreserveHost On
    SSLVerifyClient optional
    SSLVerifyDepth  1
    SSLOptions      +StdEnvVars +ExportCertData',
  }
  apache::vhost {'console':
    servername     => 'puppet.puppetlabs.vm',
    docroot        => '/var/www/puppet',
    port           => '443',
    ssl            => true,
    sslproxyengine => true,
    proxy_pass     => [{'path' => '/','url' => 'balancer://console00/'}],
    ssl_cert       => '/etc/puppetlabs/puppet/ssl/certs/puppet.puppetlabs.vm.pem',
    ssl_key        => '/etc/puppetlabs/puppet/ssl/private_keys/puppet.puppetlabs.vm.pem',
    ssl_chain      => '/etc/puppetlabs/puppet/ssl/certs/ca.pem',
    ssl_ca         => '/etc/puppetlabs/puppet/ssl/certs/ca.pem',
  }
  apache::balancer { 'puppet00':
    collect_exported => false,
  }
  apache::balancer { 'console00':
    collect_exported => false,
  }
  apache::balancermember { 'master0-puppet':
    balancer_cluster => 'puppet00',
    url              => "https://master0.puppetlabs.vm:8140",
    options          => ['ping=5','retry=5','ttl=120', 'disablereuse=on'],
  }
  apache::balancermember { 'master1-puppet':
    balancer_cluster => 'puppet00',
    url              => "https://master1.puppetlabs.vm:8140",
    options          => ['ping=5','retry=5','ttl=120', 'disablereuse=on'],
  }
  apache::balancermember { "console0-console":
    balancer_cluster => 'console00',
    url              => "https://console0.puppetlabs.vm",
    options          => ['ping=5','retry=5','ttl=120', 'disablereuse=on'],
  }
  apache::balancermember { "console1-console":
    balancer_cluster => 'console00',
    url              => "https://console1.puppetlabs.vm",
    options          => ['ping=5','retry=5','ttl=120', 'disablereuse=on'],
  }

  include haproxy
  haproxy::listen { 'mco00':
    ipaddress        => $::ipaddress,
    ports            => '61613',
    collect_exported => false,
  }
  haproxy::listen { 'puppetdb00':
    ipaddress        => $::ipaddress,
    ports            => '8081',
    collect_exported => false,
  }
  haproxy::balancermember {"master0-mco00":
    listening_service => 'mco00',
    server_names      => 'master00.puppetlabs.vm',
    ipaddresses       => '192.168.1.16',
    ports             => '61613',
    options           => 'check'
  }
  haproxy::balancermember {"master1-mco00":
    listening_service => 'mco00',
    server_names      => 'master1.puppetlabs.vm',
    ipaddresses       => '192.168.1.17',
    ports             => '61613',
    options           => 'check'
  }
  haproxy::balancermember {"puppetdb0-puppetdb00":
    listening_service => 'puppetdb00',
    server_names      => 'puppetdb0.puppetlabs.vm',
    ipaddresses       => '192.168.1.18',
    ports             => '8081',
    options           => 'check'
  }
  haproxy::balancermember {"puppetdb1-puppetdb00":
    listening_service => 'puppetdb00',
    server_names      => 'puppetdb1.puppetlabs.vm',
    ipaddresses       => '192.168.1.19',
    ports             => '8081',
    options           => 'check'
  }
}
