# vagrant-octobercms-boilerplate

An OctoberCMS application boilerplate built on [Vagrant](https://www.vagrantup.com). Get up and running in about 60 seconds.

## Setup

This project will allow you to easily bootstrap a new OctoberCMS application with minimal setup. Since it's built on Vagrant, you won't even need to worry about configuring your own environment! You only need to have a couple of things to get started:

- VirtualBox: https://www.virtualbox.org/
- Vagrant:    https://www.vagrantup.com/

You should be able to use your choice of virtual machines, but I have only tested this in VirtualBox. If you have any problems, be sure to [create an issue](https://github.com/renobit/vagrant-octobercms-boilerplate/issues).

After you have those set up, you can get started by cloning this repo:

```bash
git clone https://github.com/renobit/vagrant-octobercms-boilerplate.git my-october-project
```

Now, you can move into the new directory and launch the VM:

```bash
cd my-october-project
vagrant up
```

Note: Vagrant will download the necessary box automatically if it isn't already on the machine.
