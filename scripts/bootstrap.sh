#!/bin/sh
set -vx

# Directory in which librarian-puppet should manage its modules directory
PUPPET_DIR=$1

# Puppet Configuration file
cp /vagrant/environments/puppet.conf /etc/puppetlabs/puppet/
 
RPM_DIR=/vagrant/scripts/

echo 'Installing git...'
if [[ `whereis git | cut -s -f2 -d' '` = ''  ]]; then
  yum install --assumeyes $RPM_DIR/git-1.8.3.1-6.el7_2.1.x86_64.rpm > /dev/null
fi

echo 'Installing ruby gems...'
if [[ `whereis gem | cut -s -f2 -d' '` = ''  ]]; then
  yum install --assumeyes $RPM_DIR/rubygems-2.0.14.1-29.el7.noarch.rpm > /dev/null
fi

echo 'Installing librarian-puppet...'
if [ `gem query --local | grep librarian-puppet | wc -l` -eq 0 ]; then
  gem install librarian-puppet
  cd $PUPPET_DIR && librarian-puppet install --clean
else
  cd $PUPPET_DIR && librarian-puppet update
fi
echo 'Bootstrap install done.'

