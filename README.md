# vagrant-octobercms-boilerplate

An [OctoberCMS](https://github.com/octobercms/october) application boilerplate built on [Vagrant](https://www.vagrantup.com). Get up and running in about 60 seconds.

<p align="center">
    <img src="https://raw.githubusercontent.com/renobit/vagrant-octobercms-boilerplate/gh-pages/octobercms-screenshot.png" alt="OctoberCMS Screenshot">
</p>

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

After downloading, upgrading, and configuring the box, you will have a brand new OctoberCMS application. A couple of things to keep note of:

- The ```www``` directory holds all of your new application files
- Port ```1338``` on the host is mapped to port ```80``` in the VM

## License

[MIT](https://github.com/renobit/vagrant-octobercms-boilerplate/blob/master/LICENSE)
