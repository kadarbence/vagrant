# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
    config.vm.box = "ubuntu/jammy64"
	config.vm.hostname = "lamp81"
    config.vm.network :private_network, ip: "192.168.52.10"
	config.vm.provision :hosts, :sync_hosts => true
    config.vm.network "forwarded_port", guest: 80, host: 8080
    config.vm.network "forwarded_port", guest: 3306, host: 33060
    config.vm.synced_folder "./src/", "/var/www/html/" #, mount_options: ["dmode=775,fmode=777"]
    config.vm.provider "virtualbox" do |vb|
      vb.name = "lamp"
    end
    config.vm.provision "shell", path: "install/lamp.sh"
end
