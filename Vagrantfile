# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
	config.vm.box = "wsrv2012"
	config.vm.box_url = "d:/Flat/WSrv2012/wsrv2012.box"
	
  config.vm.define "client" do |client|
	config.vm.box = "wsrv2012"
	config.vm.box_url = "d:/Flat/WSrv2012/wsrv2012.box"
    config.vm.hostname = "hpoo01.davannico.com"
    config.vm.provider "virtualbox" do |vm|
	vm.gui = true
	end

    config.vm.provision :puppet do |puppet|
      puppet.manifests_path = "manifests"
      puppet.manifest_file  = "site.pp"
      puppet.module_path = "modules"
	  config.vm.network "public_network", ip: "10.0.2.16"
      config.vm.network "private_network", ip: "192.168.65.12"
      puppet.facter = {
        "vagrant" => "1"
      }    
    end
	
#	config.vm.synced_folder "data", "/vagrant_data"
#	end
end
end