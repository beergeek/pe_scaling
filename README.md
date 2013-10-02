Method of Installation.

Create virtual machines are required. The /pe_scaling/answers/build_script.sh can assist with this.

Clone git repository to new machines (in this case I am using /root for location)

Change answers files in /answers as required

Classification is done fully for some nodes, but does need some work

Order of installation:
master0
proxy/load balancer
pg0 (postresql server)
puppetdb0
console0
master1
puppetdb1
console1

Install Master0:
1. Change to expanded Puppet installer directory
2. Run "./puppet-enterprise-installer -A /root/pe_scaling/answers/master_ca.txt"
3. Create a link from the /root/pe_scaling/modules to /etc/puppetlabs/puppet/modules
4. Create a link from the /root/pe_scaling/manifests to /etc/puppetlabs/puppet/manifests
5. Create a link from the /root/pe_scaling/hieradata to /etc/puppetlabs/puppet/hieradata
6. Create a link from the /root/pe_scaling/hiera.yaml to /etc/puppetlabs/puppet/hiera.yaml
7. Run "puppet apply -e 'include pe_scaling::pre_db'"
8. Adjust auth.conf as required
9. Install puppetlabs/apache, puppetlabs/haproxy modules

Install Proxy/Load Balancer:
1. Change to expanded Puppet installer directory
2. Run "./puppet-enterprise-installer -A /root/pe_scaling/answers/proxy.txt"
3. Sign certificate on master
4. Run Puppet (as already classified on master)

Install Postgresql server
1. Change to expanded Puppet installer directory
2. Run "./puppet-enterprise-installer -A /root/pe_scaling/answers/pg.txt"
3. Sign certificate on master
4. Run Puppet (as already classified on master)
5. Edit /opt/puppet/var/lib/pgsql/9.2/data/postgresql.conf to have listening address as fqdn or *
6. Restart pe-postgresql

Install PuppetDB0:
1. Change to expanded Puppet installer directory
2. Run "./puppet-enterprise-installer -A /root/pe_scaling/answers/puppetdb.txt"
3. Remove current certificate from master
4. Do "rm -rf /etc/puppetlabs/puppet/ssl"
5. Edit puppet.conf to have dns_alt_name which includes the hostname and fqdn, plus "puppet,puppetlabs.vm"
6. Do a Puppet run
7. Sign certificate on Master with --allow-dns-alt-names
8. Perform "/opt/puppet/sbin/puppetdb-ssl-setup -f"
9. Start pe-puppetdb
10. Run Puppet (as already classified on master)
11. Add master0.puppetlabs.vm and master1.puppetlabs.vm to /etc/puppetlabs/puppetdb/certificate-whitelist
12. On master0 run "puppet apply -e 'include pe_scaling::pre_console'"
13. Run Puppet again and confirm that the master can communicate with PuppetDB and that PuppetDB can communicate to the Postgresql server

Install Console0:
1. Change to expanded Puppet installer directory
2. Run "./puppet-enterprise-installer -A /root/pe_scaling/answers/console.txt"
3. Sign certificate on master
4. Run Puppet (as already classified on master)

Install Master1:
1. Change to expanded Puppet installer directory
2. Run "./puppet-enterprise-installer -A /root/pe_scaling/answers/master_non_ca.txt"
3. Edit puppet.conf to has "ca = false" and "ca_server = master0.puppetlabs.vm"
4. Run "rm -rf /etc/puppetlabs/puppet/ssl"
5. Do a Puppet run to generate CSR
6. Sign certificate on master
7. Run Puppet (as already classified on master)
8. Run "ssh-copy-id root@master0" and provide password when prompted (this is for exhange of data, such as crl etc)

Install PuppetDB1:
1. Change to expanded Puppet installer directory
2. Run "./puppet-enterprise-installer -A /root/pe_scaling/answers/puppetdb.txt"
3. Remove current certificate from master
4. Do "rm -rf /etc/puppetlabs/puppet/ssl"
5. Edit puppet.conf to have dns_alt_name which includes the hostname and fqdn, plus "puppet,puppetlabs.vm"
6. Do a Puppet run
7. Sign certificate on Master with --allow-dns-alt-names
8. Perform "/opt/puppet/sbin/puppetdb-ssl-setup -f"
9. Start pe-puppetdb
10. Run Puppet (as already classified on master)
11. Add master0.puppetlabs.vm and master1.puppetlabs.vm to /etc/puppetlabs/puppetdb/certificate-whitelist

Install Console1:
1. Change to expanded Puppet installer directory
2. Edit puppet-enterprise-installer and replace the line "console_rake_task 'cert:retrieve'" with "sync -e 'ssh -i /root/.ssh/id_rsa' root@console0:/opt/puppet/share/puppet-dashboard/certs/* /opt/puppet/share/puppet-dashboard/certs/"
3. Run "./puppet-enterprise-installer -A /root/pe_scaling/answers/console.txt"
4. Sign certificate on master
5. Run Puppet (as already classified on master)

Test!
