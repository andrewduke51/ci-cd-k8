# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"
  config.vbguest.auto_update = true
  config.vm.synced_folder '.', '/vagrant', disabled: false
  config.vm.synced_folder '~/.aws/', '/home/vagrant/.aws/', disabled: false
  config.vm.provider "virtualbox" do |v|
    v.memory = 1024
    v.cpus = 1
  end
  groups = {
      #"ubuntu-base-2"      => "192.168.56.20",
      "vagrant-base"    => "192.168.56.90"
  }
  groups.each_with_index do |(machine_name, machine_ip), index|
    config.vm.define "#{machine_name}" do |machine|
      machine.vm.network :private_network, ip: "#{machine_ip}"
      machine.ssh.private_key_path = ["~/.ssh/vagrant", "~/.vagrant.d/insecure_private_key"]
      machine.ssh.insert_key = false # 1
      machine.vm.provision "file", source: "~/.ssh/vagrant.pub", destination: "/home/vagrant/.ssh/authorized_keys"
      machine.vm.hostname = "vagrant-box"


      # Only execute the Ansible provisioner,
      # when all the machines are up and ready.
      if index == groups.size - 1
        machine.vm.provision :ansible do |ansible|
          ansible.playbook       = "ansible/playbooks/site.yml"
          ansible.vault_password_file = "~/vault_pass.txt"
          #ansible.limit          = "all" # or only "nodes" group, etc.
          #ansible.inventory_path = "inventories/vagrant"
          #ansible.verbose = "-vv"
          #ansible.ask_vault_pass = true
          #ansible.extra_vars = "ansible_extra_vars.yml"
          #ansible.tags = ["vpn-servers"]
          ansible.groups = {
             "group-servers" => ["vagrant-base"],
             "group-servers:vars" => {
             "ansible_user" => "vagrant",
             "ansible_python_interpreter" => "/usr/bin/python",
             }
          }
        end
      end
    end
  end
end