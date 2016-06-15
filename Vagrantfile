# -*- mode: ruby -*-
# vi: set ft=ruby :

path = "#{File.dirname(__FILE__)}"
require 'yaml'

settings = YAML::load(File.read(path + '/settings.yaml'))

Vagrant.configure(2) do |config|

    # This config is what you should change!
    config.vm.synced_folder "PATH_TO_WEBSITES_ON_HOST_MACHINE", "/home/pinobox/www", type: "nfs"


    # Trespassing is a crime!
    scriptDir = File.dirname(__FILE__)

    config.vm.box = "pinoniq/pinobox"

    # Disable automatic box update checking.
    config.vm.box_check_update = false

    config.vm.network "forwarded_port", guest: 80, host: 8000
    config.vm.network "forwarded_port", guest: 5000, host: 5000
    config.vm.network "forwarded_port", guest: 3306, host: 33060
    config.vm.network "forwarded_port", guest: 5432, host: 54320

    # Create a private network.
    config.vm.network "private_network", ip: "192.168.10.10", auto_config: true

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

    #Clean up all currently enabled sites
    config.vm.provision "shell" do |s|
        s.path = scriptDir + "/pinobox/clean-up.sh"
    end

    # Install All The Configured Nginx Sites
    settings["sites"].each do |site|
      config.vm.provision "shell" do |s|
          if (site.has_key?("symfony") && site["symfony"])
            s.path = scriptDir + "/pinobox/symfony.sh"
            s.args = [site["map"], site["to"]]
          elsif (site.has_key?("drupal") && site["drupal"])
            s.path = scriptDir + "/pinobox/drupal.sh"
            s.args = [site["map"], site["to"]]
          elsif (site.has_key?("node") && site["node"] && site.has_key?("port"))
            s.path = scriptDir + "/pinobox/node.sh"
            s.args = [site["map"], site["to"], site["port"]]
          else
            s.path = scriptDir + "/pinobox/custom.sh"
            s.args = [site["map"], site["to"]]
          end
      end
    end

    #restart the webserver and php5-fpm
    config.vm.provision "shell" do |s|
        s.path = scriptDir + "/pinobox/restart-webserver.sh"
    end
end
