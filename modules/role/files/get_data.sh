#!/bin/bash

rsync -e "ssh -i /root/.ssh/id_rsa" --update root@master0:/etc/puppetlabs/puppet/manifests/site.pp /etc/puppetlabs/puppet/manifests/
rsync -e "ssh -i /root/.ssh/id_rsa" --update root@master0:/etc/puppetlabs/puppet/auth.conf /etc/puppetlabs/puppet/
rsync -e "ssh -i /root/.ssh/id_rsa" -a --update root@master0:/etc/puppetlabs/puppet/modules/* /etc/puppetlabs/puppet/modules/
rsync -e "ssh -i /root/.ssh/id_rsa" --update root@master0:/etc/puppetlabs/puppet/hiera.yaml /etc/puppetlabs/puppet/
rsync -e "ssh -i /root/.ssh/id_rsa" -a --update root@master0:/etc/puppetlabs/puppet/hieradata/* /etc/puppetlabs/puppet/hieradata/
rsync -e "ssh -i /root/.ssh/id_rsa" --update root@master0:/etc/puppetlabs/puppet/ssl/ca/ca_crl.pem  /etc/puppetlabs/puppet/ssl/ca/
