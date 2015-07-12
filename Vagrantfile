# Vim
# vim: set filetype=ruby:
# vim: set ft=ruby:
#
# Emacs
# -*- mode: ruby; -*-

VAGRANTFILE_API_VERSION = "2"
MAX_MEMORY = 768

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

    # Vagrant box to build on
    config.vm.box = "ubuntu/vivid64"

    # host to guest port forwarding
    config.vm.network :forwarded_port, guest: 80, host: 1338

    # settings for VirtualBox provider
    config.vm.provider "virtualbox" do |v, override|
        v.memory = MAX_MEMORY
        v.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/www", "1"]
    end

    # call provisioning shell scripts
    config.vm.provision :shell, path: "./provision.sh"
end
