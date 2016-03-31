# -*- mode: ruby -*-
# vi: set ft=ruby :

require_relative "vagrant/vagrant_helper"

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.network "forwarded_port", guest: 80, host: 8001
  config.ssh.forward_agent = true

  config.vm.provider "virtualbox" do |vm|
    # vm.name = "your vm name"

    helper = VagrantHelper.new(RbConfig::CONFIG["host_os"])
    vm.memory = helper.memory_fraction(4)
  end

  script = <<SCRIPT
    sudo apt-get update -y
    sudo apt-get install -y curl
    curl https://raw.githubusercontent.com/mjacobus/php-dev-box/master/vagrant/remote-install.sh | bash
SCRIPT

  config.vm.provision :shell, inline: script
end
