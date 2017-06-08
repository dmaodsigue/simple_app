# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "puppetlabs/centos-7.0-64-puppet"

  config.vm.network "private_network", ip: "192.168.100.101"

  config.vm.synced_folder './app/', "/home/vagrant/app/"


  config.vm.provision :shell, :path => "scripts/bootstrap.sh",  :args => ['/vagrant/environments/dev/']
  config.librarian_puppet.puppetfile_dir = 'environments/dev/modules/'


  config.vm.provision :puppet do |puppet|
    puppet.environment = "dev"
    puppet.environment_path = "environments"
    puppet.module_path = "environments/dev/modules"
  end
end
