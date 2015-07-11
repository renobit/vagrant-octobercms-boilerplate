#!/bin/bash

printf "Running Vagrant Provisioning..."

printf "Updating Box..."
# make sure the box is fully up to date
apt-get update

# comment out the line below to disallow the system to upgrade
apt-get upgrade -y && apt-get dist-upgrade -y


printf "Installing a few necessary packages..."
# install required packages
apt-get install -y git
