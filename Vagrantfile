# -*- mode: ruby -*-
# vi: set ft=ruby :

# vagrant up --provision-with "conf_int"
# 00:0c:29:ca:d4:01
# host R1 {
#   hardware ethernet 00:0c:29:ca:d4:01;
#   fixed-address 172.16.55.11;
# }


Vagrant.configure("2") do |config|
  
  config.vm.provision "conf_int", type: "ansible" do |ansible|
     ansible.playbook = "vagrant-vios.yml"
     ansible.compatibility_mode = "2.0"
     ansible.tags = "conf_int"
   end

  config.vm.provision "conf_cdp", type: "ansible" do |ansible|
     ansible.playbook = "vagrant-vios.yml"
     ansible.compatibility_mode = "2.0"
          ansible.tags = "conf_cdp"
   end


  config.vm.provision "ping_int", type: "ansible" do |ansible|
     ansible.playbook = "vagrant-vios.yml"
     ansible.compatibility_mode = "2.0"
          ansible.tags = "ping_int"
   end

  config.vm.provision "ping_loop", type: "ansible" do |ansible|
     ansible.playbook = "vagrant-vios.yml"
     ansible.compatibility_mode = "2.0"
          ansible.tags = "ping_loop"
   end

  config.vm.provision "int_reset", type: "ansible" do |ansible|
     ansible.playbook = "vagrant-vios.yml"
     ansible.compatibility_mode = "2.0"
          ansible.tags = "int_reset"
   end


  config.vm.define "R1" do |node|
    node.ssh.insert_key = false
    node.vm.box = "cisco-iosv-l3-156-2"
    node.vm.boot_timeout = 90
    # Disable default host <-> guest synced folder
    node.vm.synced_folder ".", "/vagrant", disabled: true
    # Set guest OS type to disable autodetection
    node.vm.guest = :freebsd
    node.vm.network :forwarded_port, guest: 22, host: 2201, id: "ssh", disabled: true

    node.vm.provider :vmware_desktop do |v|
      v.vmx['ethernet1.connectionType'] = "custom"
      v.vmx['ethernet1.vnet'] = "vmnet12"
      v.vmx['ethernet1.addressType'] = "generated"
      v.vmx['ethernet1.virtualDev'] = "e1000"
      v.vmx['ethernet1.present'] = "TRUE"

      v.vmx['ethernet2.connectionType'] = "custom"
      v.vmx['ethernet2.vnet'] = "vmnet14"
      v.vmx['ethernet2.addressType'] = "generated"
      v.vmx['ethernet2.virtualDev'] = "e1000"
      v.vmx['ethernet2.present'] = "TRUE"
      
      v.vmx['ethernet3.connectionType'] = "custom"
      v.vmx['ethernet3.vnet'] = "vmnet15"
      v.vmx['ethernet3.addressType'] = "generated"
      v.vmx['ethernet3.virtualDev'] = "e1000"
      v.vmx['ethernet3.present'] = "TRUE"
      
      v.vmx['ethernet4.connectionType'] = "custom"
      v.vmx['ethernet4.vnet'] = "vmnet17"
      v.vmx['ethernet4.addressType'] = "generated"
      v.vmx['ethernet4.virtualDev'] = "e1000"
      v.vmx['ethernet4.present'] = "TRUE"

      # https://www.vagrantup.com/docs/vmware/configuration.html#linked_clone
      v.linked_clone = false
      # https://www.vagrantup.com/docs/vmware/boxes.html#vmx-whitelisting
      v.whitelist_verified = true
      # https://www.vagrantup.com/docs/vmware/configuration.html#ssh_info_public
      v.ssh_info_public = true
      # Console port connection via telnet (or netcat)
      v.vmx["serial0.fileName"] = "telnet://127.0.0.1:52001"
    end
  end

  config.vm.define "R2" do |node|
    node.ssh.insert_key = false
    node.vm.box = "cisco-iosv-l3-156-2"
    node.vm.boot_timeout = 90
    # Disable default host <-> guest synced folder
    node.vm.synced_folder ".", "/vagrant", disabled: true
    # Set guest OS type to disable autodetection
    node.vm.guest = :freebsd
    # Disable port forwarding for SSH
    node.vm.network :forwarded_port, guest: 22, host: 2202, id: "ssh", disabled: true
#    node.vm.network 'private_network', type: dhcp
#    node.vm.network 'private_network', type: dhcp

    node.vm.provider :vmware_desktop do |v|
      v.vmx['ethernet1.connectionType'] = "custom"
      v.vmx['ethernet1.vnet'] = "vmnet12"
      v.vmx['ethernet1.addressType'] = "generated"
      v.vmx['ethernet1.virtualDev'] = "e1000"
      v.vmx['ethernet1.present'] = "TRUE"

      v.vmx['ethernet2.connectionType'] = "custom"
      v.vmx['ethernet2.vnet'] = "vmnet25"
      v.vmx['ethernet2.addressType'] = "generated"
      v.vmx['ethernet2.virtualDev'] = "e1000"
      v.vmx['ethernet2.present'] = "TRUE"
      
      v.vmx['ethernet3.connectionType'] = "custom"
      v.vmx['ethernet3.vnet'] = "vmnet23"
      v.vmx['ethernet3.addressType'] = "generated"
      v.vmx['ethernet3.virtualDev'] = "e1000"
      v.vmx['ethernet3.present'] = "TRUE"
      
      v.vmx['ethernet4.connectionType'] = "custom"
      v.vmx['ethernet4.vnet'] = "vmnet24"
      v.vmx['ethernet4.addressType'] = "generated"
      v.vmx['ethernet4.virtualDev'] = "e1000"
      v.vmx['ethernet4.present'] = "TRUE"

      v.vmx['ethernet5.connectionType'] = "custom"
      v.vmx['ethernet5.vnet'] = "vmnet26"
      v.vmx['ethernet5.addressType'] = "generated"
      v.vmx['ethernet5.virtualDev'] = "e1000"
      v.vmx['ethernet5.present'] = "TRUE"

      # https://www.vagrantup.com/docs/vmware/configuration.html#linked_clone
      v.linked_clone = false
      # https://www.vagrantup.com/docs/vmware/boxes.html#vmx-whitelisting
      v.whitelist_verified = true
      # https://www.vagrantup.com/docs/vmware/configuration.html#ssh_info_public
      v.ssh_info_public = true
      # Console port connection via telnet (or netcat)
      v.vmx["serial0.fileName"] = "telnet://127.0.0.1:52002"
    end
  end

  config.vm.define "R3" do |node|
    node.ssh.insert_key = false
    node.vm.box = "cisco-iosv-l3-156-2"
    node.vm.boot_timeout = 90
    # Disable default host <-> guest synced folder
    node.vm.synced_folder ".", "/vagrant", disabled: true
    # Set guest OS type to disable autodetection
    node.vm.guest = :freebsd
    # Disable port forwarding for SSH
    node.vm.network :forwarded_port, guest: 22, host: 2203, id: "ssh", disabled: true
#    node.vm.network 'private_network', type: dhcp
#    node.vm.network 'private_network', type: dhcp

    node.vm.provider :vmware_desktop do |v|
      v.vmx['ethernet1.connectionType'] = "custom"
      v.vmx['ethernet1.vnet'] = "vmnet38"
      v.vmx['ethernet1.addressType'] = "generated"
      v.vmx['ethernet1.virtualDev'] = "e1000"
      v.vmx['ethernet1.present'] = "TRUE"

      v.vmx['ethernet2.connectionType'] = "custom"
      v.vmx['ethernet2.vnet'] = "vmnet36"
      v.vmx['ethernet2.addressType'] = "generated"
      v.vmx['ethernet2.virtualDev'] = "e1000"
      v.vmx['ethernet2.present'] = "TRUE"

      v.vmx['ethernet3.connectionType'] = "custom"
      v.vmx['ethernet3.vnet'] = "vmnet23"
      v.vmx['ethernet3.addressType'] = "generated"
      v.vmx['ethernet3.virtualDev'] = "e1000"
      v.vmx['ethernet3.present'] = "TRUE"

      v.vmx['ethernet4.connectionType'] = "custom"
      v.vmx['ethernet4.vnet'] = "vmnet35"
      v.vmx['ethernet4.addressType'] = "generated"
      v.vmx['ethernet4.virtualDev'] = "e1000"
      v.vmx['ethernet4.present'] = "TRUE"

      # https://www.vagrantup.com/docs/vmware/configuration.html#linked_clone
      v.linked_clone = false
      # https://www.vagrantup.com/docs/vmware/boxes.html#vmx-whitelisting
      v.whitelist_verified = true
      # https://www.vagrantup.com/docs/vmware/configuration.html#ssh_info_public
      v.ssh_info_public = true
      # Console port connection via telnet (or netcat)
      v.vmx["serial0.fileName"] = "telnet://127.0.0.1:52003"
    end
  end

  config.vm.define "R4" do |node|
    node.ssh.insert_key = false
    node.vm.box = "cisco-iosv-l3-156-2"
    node.vm.boot_timeout = 90
    # Disable default host <-> guest synced folder
    node.vm.synced_folder ".", "/vagrant", disabled: true
    # Set guest OS type to disable autodetection
    node.vm.guest = :freebsd
    # Disable port forwarding for SSH
    node.vm.network :forwarded_port, guest: 22, host: 2204, id: "ssh", disabled: true
#    node.vm.network 'private_network', type: dhcp
#    node.vm.network 'private_network', type: dhcp

    node.vm.provider :vmware_desktop do |v|
      v.vmx['ethernet1.connectionType'] = "custom"
      v.vmx['ethernet1.vnet'] = "vmnet45"
      v.vmx['ethernet1.addressType'] = "generated"
      v.vmx['ethernet1.virtualDev'] = "e1000"
      v.vmx['ethernet1.present'] = "TRUE"

      v.vmx['ethernet2.connectionType'] = "custom"
      v.vmx['ethernet2.vnet'] = "vmnet14"
      v.vmx['ethernet2.addressType'] = "generated"
      v.vmx['ethernet2.virtualDev'] = "e1000"
      v.vmx['ethernet2.present'] = "TRUE"

      v.vmx['ethernet3.connectionType'] = "custom"
      v.vmx['ethernet3.vnet'] = "vmnet24"
      v.vmx['ethernet3.addressType'] = "generated"
      v.vmx['ethernet3.virtualDev'] = "e1000"
      v.vmx['ethernet3.present'] = "TRUE"

      v.vmx['ethernet4.connectionType'] = "custom"
      v.vmx['ethernet4.vnet'] = "vmnet47"
      v.vmx['ethernet4.addressType'] = "generated"
      v.vmx['ethernet4.virtualDev'] = "e1000"
      v.vmx['ethernet4.present'] = "TRUE"

      # https://www.vagrantup.com/docs/vmware/configuration.html#linked_clone
      v.linked_clone = false
      # https://www.vagrantup.com/docs/vmware/boxes.html#vmx-whitelisting
      v.whitelist_verified = true
      # https://www.vagrantup.com/docs/vmware/configuration.html#ssh_info_public
      v.ssh_info_public = true
      # Console port connection via telnet (or netcat)
      v.vmx["serial0.fileName"] = "telnet://127.0.0.1:52004"
    end

  end

  config.vm.define "R5" do |node|
    node.ssh.insert_key = false
    node.vm.box = "cisco-iosv-l3-156-2"
    node.vm.boot_timeout = 90
    # Disable default host <-> guest synced folder
    node.vm.synced_folder ".", "/vagrant", disabled: true
    # Set guest OS type to disable autodetection
    node.vm.guest = :freebsd
    # Disable port forwarding for SSH
    node.vm.network :forwarded_port, guest: 22, host: 2205, id: "ssh", disabled: true
#    node.vm.network 'private_network', type: dhcp
#    node.vm.network 'private_network', type: dhcp

    node.vm.provider :vmware_desktop do |v|
      v.vmx['ethernet1.connectionType'] = "custom"
      v.vmx['ethernet1.vnet'] = "vmnet45"
      v.vmx['ethernet1.addressType'] = "generated"
      v.vmx['ethernet1.virtualDev'] = "e1000"
      v.vmx['ethernet1.present'] = "TRUE"

      v.vmx['ethernet2.connectionType'] = "custom"
      v.vmx['ethernet2.vnet'] = "vmnet25"
      v.vmx['ethernet2.addressType'] = "generated"
      v.vmx['ethernet2.virtualDev'] = "e1000"
      v.vmx['ethernet2.present'] = "TRUE"
      
      v.vmx['ethernet3.connectionType'] = "custom"
      v.vmx['ethernet3.vnet'] = "vmnet56"
      v.vmx['ethernet3.addressType'] = "generated"
      v.vmx['ethernet3.virtualDev'] = "e1000"
      v.vmx['ethernet3.present'] = "TRUE"
      
      v.vmx['ethernet4.connectionType'] = "custom"
      v.vmx['ethernet4.vnet'] = "vmnet35"
      v.vmx['ethernet4.addressType'] = "generated"
      v.vmx['ethernet4.virtualDev'] = "e1000"
      v.vmx['ethernet4.present'] = "TRUE"

      v.vmx['ethernet5.connectionType'] = "custom"
      v.vmx['ethernet5.vnet'] = "vmnet15"
      v.vmx['ethernet5.addressType'] = "generated"
      v.vmx['ethernet5.virtualDev'] = "e1000"
      v.vmx['ethernet5.present'] = "TRUE"

      # https://www.vagrantup.com/docs/vmware/configuration.html#linked_clone
      v.linked_clone = false
      # https://www.vagrantup.com/docs/vmware/boxes.html#vmx-whitelisting
      v.whitelist_verified = true
      # https://www.vagrantup.com/docs/vmware/configuration.html#ssh_info_public
      v.ssh_info_public = true
      # Console port connection via telnet (or netcat)
      v.vmx["serial0.fileName"] = "telnet://127.0.0.1:52005"
    end

  end

  config.vm.define "R6" do |node|
    node.ssh.insert_key = false
    node.vm.box = "cisco-iosv-l3-156-2"
    node.vm.boot_timeout = 90
    # Disable default host <-> guest synced folder
    node.vm.synced_folder ".", "/vagrant", disabled: true
    # Set guest OS type to disable autodetection
    node.vm.guest = :freebsd
    node.vm.network :forwarded_port, guest: 22, host: 2206, id: "ssh", disabled: true

    node.vm.provider :vmware_desktop do |v|
      v.vmx['ethernet1.connectionType'] = "custom"
      v.vmx['ethernet1.vnet'] = "vmnet68"
      v.vmx['ethernet1.addressType'] = "generated"
      v.vmx['ethernet1.virtualDev'] = "e1000"
      v.vmx['ethernet1.present'] = "TRUE"

      v.vmx['ethernet2.connectionType'] = "custom"
      v.vmx['ethernet2.vnet'] = "vmnet36"
      v.vmx['ethernet2.addressType'] = "generated"
      v.vmx['ethernet2.virtualDev'] = "e1000"
      v.vmx['ethernet2.present'] = "TRUE"
      
      v.vmx['ethernet3.connectionType'] = "custom"
      v.vmx['ethernet3.vnet'] = "vmnet56"
      v.vmx['ethernet3.addressType'] = "generated"
      v.vmx['ethernet3.virtualDev'] = "e1000"
      v.vmx['ethernet3.present'] = "TRUE"
      
      v.vmx['ethernet4.connectionType'] = "custom"
      v.vmx['ethernet4.vnet'] = "vmnet26"
      v.vmx['ethernet4.addressType'] = "generated"
      v.vmx['ethernet4.virtualDev'] = "e1000"
      v.vmx['ethernet4.present'] = "TRUE"

      # https://www.vagrantup.com/docs/vmware/configuration.html#linked_clone
      v.linked_clone = false
      # https://www.vagrantup.com/docs/vmware/boxes.html#vmx-whitelisting
      v.whitelist_verified = true
      # https://www.vagrantup.com/docs/vmware/configuration.html#ssh_info_public
      v.ssh_info_public = true
      # Console port connection via telnet (or netcat)
      v.vmx["serial0.fileName"] = "telnet://127.0.0.1:52006"
    end
  end

  config.vm.define "R7" do |node|
    node.ssh.insert_key = false
    node.vm.box = "cisco-iosv-l3-156-2"
    node.vm.boot_timeout = 90
    # Disable default host <-> guest synced folder
    node.vm.synced_folder ".", "/vagrant", disabled: true
    # Set guest OS type to disable autodetection
    node.vm.guest = :freebsd
    node.vm.network :forwarded_port, guest: 22, host: 2207, id: "ssh", disabled: true

    node.vm.provider :vmware_desktop do |v|
      v.vmx['ethernet1.connectionType'] = "custom"
      v.vmx['ethernet1.vnet'] = "vmnet17"
      v.vmx['ethernet1.addressType'] = "generated"
      v.vmx['ethernet1.virtualDev'] = "e1000"
      v.vmx['ethernet1.present'] = "TRUE"

      v.vmx['ethernet2.connectionType'] = "custom"
      v.vmx['ethernet2.vnet'] = "vmnet47"
      v.vmx['ethernet2.addressType'] = "generated"
      v.vmx['ethernet2.virtualDev'] = "e1000"
      v.vmx['ethernet2.present'] = "TRUE"
      
      # https://www.vagrantup.com/docs/vmware/configuration.html#linked_clone
      v.linked_clone = false
      # https://www.vagrantup.com/docs/vmware/boxes.html#vmx-whitelisting
      v.whitelist_verified = true
      # https://www.vagrantup.com/docs/vmware/configuration.html#ssh_info_public
      v.ssh_info_public = true
      # Console port connection via telnet (or netcat)
      v.vmx["serial0.fileName"] = "telnet://127.0.0.1:52007"
    end
  end

  config.vm.define "R8" do |node|
    node.ssh.insert_key = false
    node.vm.box = "cisco-iosv-l3-156-2"
    node.vm.boot_timeout = 90
    # Disable default host <-> guest synced folder
    node.vm.synced_folder ".", "/vagrant", disabled: true
    # Set guest OS type to disable autodetection
    node.vm.guest = :freebsd
    node.vm.network :forwarded_port, guest: 22, host: 2208, id: "ssh", disabled: true

    node.vm.provider :vmware_desktop do |v|
      v.vmx['ethernet1.connectionType'] = "custom"
      v.vmx['ethernet1.vnet'] = "vmnet38"
      v.vmx['ethernet1.addressType'] = "generated"
      v.vmx['ethernet1.virtualDev'] = "e1000"
      v.vmx['ethernet1.present'] = "TRUE"

      v.vmx['ethernet2.connectionType'] = "custom"
      v.vmx['ethernet2.vnet'] = "vmnet68"
      v.vmx['ethernet2.addressType'] = "generated"
      v.vmx['ethernet2.virtualDev'] = "e1000"
      v.vmx['ethernet2.present'] = "TRUE"
      
      # https://www.vagrantup.com/docs/vmware/configuration.html#linked_clone
      v.linked_clone = false
      # https://www.vagrantup.com/docs/vmware/boxes.html#vmx-whitelisting
      v.whitelist_verified = true
      # https://www.vagrantup.com/docs/vmware/configuration.html#ssh_info_public
      v.ssh_info_public = true
      # Console port connection via telnet (or netcat)
      v.vmx["serial0.fileName"] = "telnet://127.0.0.1:52008"
    end
  end

end

