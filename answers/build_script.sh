#!/bin/bash

clear

echo "*******************************"
echo "Build Menu. Select Server"
echo "*******************************"
echo "1 for master0.puppetlabs.vm"
echo "2 for master1.puppetlabs.vm"
echo "3 for console0.puppetlabs.vm"
echo "4 for console1.puppetlabs.vm"
echo "5 for puppetdb0.puppetlabs.vm"
echo "6 for puppetdb1.puppetlabs.vm"
echo "7 for pg0.puppetlabs.vm"
echo "8 for proxy.puppetlabs.vm"
echo -e "Enter your selection here and hit <return> .. \c"
read server_choice
case $server_choice in
  1)
    HOSTNAME="master0.puppetlabs.vm"
    IP="192.168.1.16";;
  2)
    HOSTNAME="master1.puppetlabs.vm"
    IP="192.168.1.17";;
  3)
    HOSTNAME="console0.puppetlabs.vm"
    IP="192.168.1.22";;
  4)
    HOSTNAME="console1.puppetlabs.vm"
    IP="192.168.1.23";;
  5)
    HOSTNAME="puppetdb0.puppetlabs.vm"
    IP="192.168.1.18";;
  6)
    HOSTNAME="puppetdb1.puppetlabs.vm"
    IP="192.168.1.19";;
  7)
    HOSTNAME="pg0.puppetlabs.vm"
    IP="192.168.1.20";;
  8)
    HOSTNAME="proxy.puppetlabs.vm"
    IP="192.168.1.24";;
  *) exit 1
esac
NETMASK="255.255.255.224"
GATEWAY="192.168.1.1"

cat <<EOF> /etc/sysconfig/network
NETWORKING=yes
NETWORKING_IPV6=yes
HOSTNAME=$HOSTNAME
EOF

cat <<EOF> /etc/sysconfig/network-scripts/ifcfg-eth0
DEVICE="eth0"
BOOTPROTO="static"
IPV6INIT="yes"
NM_CONTROLLED="no"
ONBOOT="yes"
TYPE="Ethernet"
IPADDR=$IP
NETMASK=$NETMASK
GATEWAY=$GATEWAY
EOF

cat <<EOF> /etc/resolv.conf
nameserver $GATEWAY
EOF

cat <<EOF> /etc/hosts
127.0.0.1 localhost localhost.localdomain localhost4 localhost4.localdomain4 training.puppetlabs.vm training
192.168.1.16  master0.puppetlabs.vm master0
192.168.1.20  pg0.puppetlabs.vm pg0
192.168.1.18  puppetdb0.puppetlabs.vm puppetdb0
192.168.1.23  console1.puppetlabs.vm  console1
192.168.1.24  puppet.puppetlabs.vm  puppet proxy proxy.puppetlabs.vm
192.168.1.22  console0.puppetlabs.vm  console0
192.168.1.19  puppetdb1.puppetlabs.vm puppetdb1
192.168.1.17  master1.puppetlabs.vm master1
192.168.1.28  agent0.puppetlabs.vm  agent0
EOF

hostname $HOSTNAME
