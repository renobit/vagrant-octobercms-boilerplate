#!/bin/bash


mysql_root_password="Renobit"


printf "Running Vagrant Provisioning..."

printf "Updating Box..."
# make sure the box is fully up to date
apt-get update -qq > /dev/null

# comment out the line below to disallow the system to upgrade
# apt-get upgrade -y && apt-get dist-upgrade -y

# suppress prompts
export DEBIAN_FRONTEND=noninteractive


printf "Installing a few necessary packages..."
# install required packages
apt-get install -qq git


printf "Installing MySQL..."
# install MySQL
apt-get install -qq mysql-server

# update root password
mysqladmin -u root password ${mysql_root_password}
