class profile::base {

  include hosts

yumrepo { 'C6.0-base':
  baseurl  => 'http://vault.centos.org/6.0/os/$basearch/',
  descr    => 'CentOS-6.0 - Base',
  enabled  => '0',
  gpgcheck => '1',
  gpgkey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6',
}
yumrepo { 'C6.0-centosplus':
  baseurl  => 'http://vault.centos.org/6.0/centosplus/$basearch/',
  descr    => 'CentOS-6.0 - CentOSPlus',
  enabled  => '0',
  gpgcheck => '1',
  gpgkey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6',
}
yumrepo { 'C6.0-contrib':
  baseurl  => 'http://vault.centos.org/6.0/contrib/$basearch/',
  descr    => 'CentOS-6.0 - Contrib',
  enabled  => '0',
  gpgcheck => '1',
  gpgkey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6',
}
yumrepo { 'C6.0-extras':
  baseurl  => 'http://vault.centos.org/6.0/extras/$basearch/',
  descr    => 'CentOS-6.0 - Extras',
  enabled  => '0',
  gpgcheck => '1',
  gpgkey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6',
}
yumrepo { 'C6.0-updates':
  baseurl  => 'http://vault.centos.org/6.0/updates/$basearch/',
  descr    => 'CentOS-6.0 - Updates',
  enabled  => '0',
  gpgcheck => '1',
  gpgkey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6',
}
yumrepo { 'C6.1-base':
  baseurl  => 'http://vault.centos.org/6.1/os/$basearch/',
  descr    => 'CentOS-6.1 - Base',
  enabled  => '0',
  gpgcheck => '1',
  gpgkey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6',
}
yumrepo { 'C6.1-centosplus':
  baseurl  => 'http://vault.centos.org/6.1/centosplus/$basearch/',
  descr    => 'CentOS-6.1 - CentOSPlus',
  enabled  => '0',
  gpgcheck => '1',
  gpgkey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6',
}
yumrepo { 'C6.1-contrib':
  baseurl  => 'http://vault.centos.org/6.1/contrib/$basearch/',
  descr    => 'CentOS-6.1 - Contrib',
  enabled  => '0',
  gpgcheck => '1',
  gpgkey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6',
}
yumrepo { 'C6.1-extras':
  baseurl  => 'http://vault.centos.org/6.1/extras/$basearch/',
  descr    => 'CentOS-6.1 - Extras',
  enabled  => '0',
  gpgcheck => '1',
  gpgkey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6',
}
yumrepo { 'C6.1-updates':
  baseurl  => 'http://vault.centos.org/6.1/updates/$basearch/',
  descr    => 'CentOS-6.1 - Updates',
  enabled  => '0',
  gpgcheck => '1',
  gpgkey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6',
}
yumrepo { 'C6.2-base':
  baseurl  => 'http://vault.centos.org/6.2/os/$basearch/',
  descr    => 'CentOS-6.2 - Base',
  enabled  => '0',
  gpgcheck => '1',
  gpgkey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6',
}
yumrepo { 'C6.2-centosplus':
  baseurl  => 'http://vault.centos.org/6.2/centosplus/$basearch/',
  descr    => 'CentOS-6.2 - CentOSPlus',
  enabled  => '0',
  gpgcheck => '1',
  gpgkey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6',
}
yumrepo { 'C6.2-contrib':
  baseurl  => 'http://vault.centos.org/6.2/contrib/$basearch/',
  descr    => 'CentOS-6.2 - Contrib',
  enabled  => '0',
  gpgcheck => '1',
  gpgkey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6',
}
yumrepo { 'C6.2-extras':
  baseurl  => 'http://vault.centos.org/6.2/extras/$basearch/',
  descr    => 'CentOS-6.2 - Extras',
  enabled  => '0',
  gpgcheck => '1',
  gpgkey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6',
}
yumrepo { 'C6.2-updates':
  baseurl  => 'http://vault.centos.org/6.2/updates/$basearch/',
  descr    => 'CentOS-6.2 - Updates',
  enabled  => '0',
  gpgcheck => '1',
  gpgkey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6',
}
yumrepo { 'base':
  descr      => 'CentOS-$releasever - Base',
  enabled    => '1',
  gpgcheck   => '1',
  gpgkey     => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6',
  mirrorlist => 'http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=os',
}
yumrepo { 'base_local':
  baseurl  => 'file:///var/yum/mirror/centos/6/os/i386',
  descr    => 'Locally stored packages for base_local',
  enabled  => '1',
  gpgcheck => '0',
}
yumrepo { 'c6-media':
  baseurl  => 'file:///media/CentOS/
        file:///media/cdrom/
        file:///media/cdrecorder/',
  descr    => 'CentOS-$releasever - Media',
  enabled  => '0',
  gpgcheck => '1',
  gpgkey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6',
}
yumrepo { 'centosplus':
  descr      => 'CentOS-$releasever - Plus',
  enabled    => '0',
  gpgcheck   => '1',
  gpgkey     => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6',
  mirrorlist => 'http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=centosplus',
}
yumrepo { 'contrib':
  descr      => 'CentOS-$releasever - Contrib',
  enabled    => '0',
  gpgcheck   => '1',
  gpgkey     => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6',
  mirrorlist => 'http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=contrib',
}
yumrepo { 'debug':
  baseurl  => 'http://debuginfo.centos.org/6/$basearch/',
  descr    => 'CentOS-6 - Debuginfo',
  enabled  => '0',
  gpgcheck => '1',
  gpgkey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-Debug-6',
}
yumrepo { 'epel':
  descr          => 'Extra Packages for Enterprise Linux 6 - $basearch',
  enabled        => '0',
  failovermethod => 'priority',
  gpgcheck       => '1',
  gpgkey         => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6',
  mirrorlist     => 'https://mirrors.fedoraproject.org/metalink?repo=epel-6&arch=$basearch',
}
yumrepo { 'epel-debuginfo':
  descr          => 'Extra Packages for Enterprise Linux 6 - $basearch - Debug',
  enabled        => '0',
  failovermethod => 'priority',
  gpgcheck       => '1',
  gpgkey         => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6',
  mirrorlist     => 'https://mirrors.fedoraproject.org/metalink?repo=epel-debug-6&arch=$basearch',
}
yumrepo { 'epel-source':
  descr          => 'Extra Packages for Enterprise Linux 6 - $basearch - Source',
  enabled        => '0',
  failovermethod => 'priority',
  gpgcheck       => '1',
  gpgkey         => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6',
  mirrorlist     => 'https://mirrors.fedoraproject.org/metalink?repo=epel-source-6&arch=$basearch',
}
yumrepo { 'epel-testing':
  descr          => 'Extra Packages for Enterprise Linux 6 - Testing - $basearch',
  enabled        => '0',
  failovermethod => 'priority',
  gpgcheck       => '1',
  gpgkey         => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6',
  mirrorlist     => 'https://mirrors.fedoraproject.org/metalink?repo=testing-epel6&arch=$basearch',
}
yumrepo { 'epel-testing-debuginfo':
  descr          => 'Extra Packages for Enterprise Linux 6 - Testing - $basearch - Debug',
  enabled        => '0',
  failovermethod => 'priority',
  gpgcheck       => '1',
  gpgkey         => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6',
  mirrorlist     => 'https://mirrors.fedoraproject.org/metalink?repo=testing-debug-epel6&arch=$basearch',
}
yumrepo { 'epel-testing-source':
  descr          => 'Extra Packages for Enterprise Linux 6 - Testing - $basearch - Source',
  enabled        => '0',
  failovermethod => 'priority',
  gpgcheck       => '1',
  gpgkey         => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6',
  mirrorlist     => 'https://mirrors.fedoraproject.org/metalink?repo=testing-source-epel6&arch=$basearch',
}
yumrepo { 'epel_local':
  baseurl  => 'file:///var/yum/mirror/epel/6/local/i386',
  descr    => 'Locally stored packages for epel_local',
  enabled  => '1',
  gpgcheck => '0',
}
yumrepo { 'extras':
  descr      => 'CentOS-$releasever - Extras',
  enabled    => '0',
  gpgcheck   => '1',
  gpgkey     => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6',
  mirrorlist => 'http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=extras',
}
yumrepo { 'puppetlabs':
  baseurl  => 'http://yum.puppetlabs.com/base/',
  descr    => 'Puppetlabs yum repo',
  enabled  => '0',
  gpgcheck => '0',
}
yumrepo { 'puppetlabs-enterprise-extras':
  baseurl  => 'http://yum-enterprise.puppetlabs.com/el/6/extras/$basearch',
  descr    => 'Puppet Labs Enterprise Extras 6 - $basearch',
  enabled  => '1',
  gpgcheck => '1',
  gpgkey   => 'file:///etc/pki/rpm-gpg/enterprise-extras-RPM-GPG-KEY-puppetlabs',
}
yumrepo { 'puppetlabs-enterprise-extras_local':
  baseurl  => 'file:///var/yum/mirror/puppetlabs-enterprise-extras/6/local/i386',
  descr    => 'Locally stored packages for puppetlabs-enterprise-extras_local',
  enabled  => '1',
  gpgcheck => '0',
}
yumrepo { 'updates':
  descr      => 'CentOS-$releasever - Updates',
  enabled    => '1',
  gpgcheck   => '1',
  gpgkey     => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6',
  mirrorlist => 'http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=updates',
}
}
