#!/bin/bash

# Standard System Tools
apt-get install -y htop iotop iftop mc screen sudo curl
apt-get install -y aptitude

# SSH Keys
mkdir ~/.ssh/
wget https://raw.githubusercontent.com/QDaniel/administration/main/authorized_keys -O ~/.ssh/authorized_keys

# Puppet
wget https://apt.puppetlabs.com/puppet7-release-buster.deb
dpkg -i puppet7-release-buster.deb
apt-get update
apt-get install -y puppet-agent

/opt/puppetlabs/bin/puppet config set server puppet.$(domainname -d) --section main
/opt/puppetlabs/bin/puppet resource service puppet ensure=running enable=true
