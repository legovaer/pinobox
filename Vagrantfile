# -*- mode: ruby -*-
# vi: set ft=ruby :


Vagrant.configure(2) do |config|

    scriptDir = File.dirname(__FILE__)

    config.vm.box = "pinoniq/pinobox"

    # Disable automatic box update checking.
    config.vm.box_check_update = false

    config.vm.network "forwarded_port", guest: 80, host: 8000
    config.vm.network "forwarded_port", guest: 5000, host: 5000
    config.vm.network "forwarded_port", guest: 3306, host: 33060
    config.vm.network "forwarded_port", guest: 5432, host: 54320

    # Create a private network.
    config.vm.network "private_network", ip: "192.168.10.10", auto_config: false

    config.vm.synced_folder "../GitHub", "/home/pinobox/www"

    config.vm.provider "virtualbox" do |vb|
        vb.memory = "1024"
    end

    config.vm.provider "virtualbox" do |vb|
        vb.customize ["modifyvm", :id, "--memory", "2048"]
        vb.customize ["modifyvm", :id, "--cpus", "1"]
        vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
        vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    end

    config.ssh.insert_key = false
    config.ssh.username = "pinobox"

    config.vm.provision "shell" do |s|
        s.path = scriptDir + "/symfony.sh"
        s.args = ["hostname"]
    end
end
