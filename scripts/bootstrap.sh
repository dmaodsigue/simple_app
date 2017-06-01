#!/bin/sh
set -vx

# Directory in which librarian-puppet should manage its modules directory
PUPPET_DIR=$1

echo 'Installing git...'
yum install --assumeyes git > /dev/null
echo 'Installing ruby gems...'
yum install --assumeyes gem > /dev/null

echo 'Installing librarian-puppet...'
if [ `gem query --local | grep librarian-puppet | wc -l` -eq 0 ]; then
  gem install librarian-puppet
  cd $PUPPET_DIR && librarian-puppet install --clean
else
  cd $PUPPET_DIR && librarian-puppet update
fi
echo 'Bootstrap install done.'

