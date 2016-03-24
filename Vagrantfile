# -*- mode: ruby -*-

# vi: set ft=ruby :

boxes = [
    {
        :name => "webserver",
        :eth1 => "192.168.100.101",
        :mem => "2048",
        :cpu => "2",
        :postinstallscript => "webserver_post.sh"
    },
    {
        :name => "databaseserver",
        :eth1 => "192.168.100.102",
        :mem => "2048",
        :cpu => "4",
        :postinstallscript => "databaseserver_post.sh"
    },
    {
        :name => "batchserver",
        :eth1 => "192.168.100.103",
        :mem => "2048",
        :cpu => "2",
        :postinstallscript => "batchserver_post.sh"
    }
]

Vagrant.configure(2) do |config|

  config.vm.box = "hashicorp/precise64"

  # Turn off shared folders
  config.vm.synced_folder ".", "/vagrant", id: "vagrant-root", disabled: true

  boxes.each do |opts|
    config.vm.define opts[:name] do |config|
      p 'Provisioning: ' + opts[:name] + ' ' + opts[:cpu] + ' CPUs, ' + opts[:mem] + ' RAM'
    
      config.vm.hostname = opts[:name]
      config.vm.network :private_network, ip: opts[:eth1]

      config.vm.provider "virtualbox" do |v|
        v.customize ["modifyvm", :id, "--memory", opts[:mem]]
        v.customize ["modifyvm", :id, "--cpus", opts[:cpu]]
      end
      
      config.vm.provider "hyperv" do |hv|
        hv.vmname = opts[:name]
        hv.memory = opts[:mem]
        hv.cpus = opts[:cpu]
      end
      
      config.vm.provision :shell, path: opts[:postinstallscript]

    end
  end
end