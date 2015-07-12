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


printf "Installing Nginx..."
# adding source list
echo "deb http://ppa.launchpad.net/nginx/stable/ubuntu $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/nginx-stable.list

# adding key
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys C300EE8C

# install nginx
apt-get update -qq > /dev/null
apt-get install -qq nginx

# configure nginx
cp /etc/nginx/sites-available/default /etc/nginx/sites-available/default.backup

tee /etc/nginx/sites-available/default << 'EOF'
server {
        listen 80 default_server;
        listen [::]:80 default_server;

        root /vagrant/www;
        index index.php index.html index.htm;

        server_name _;

        location / {
                try_files $uri $uri/ /index.html;
        }

        error_page 404 /404.html;
        error_page 500 502 503 504 /50x.html;

        location = /50x.html {
              root /usr/share/nginx/www;
        }

        # pass the PHP scripts to FastCGI server listening on the php-fpm socket
        location ~ \.php$ {
                try_files $uri =404;
                fastcgi_pass unix:/var/run/php5-fpm.sock;
                fastcgi_index index.php;
                fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
                include fastcgi_params;
        }

}
EOF

# start nginx
service nginx restart


printf "Installing PHP..."
# install PHP
apt-get install -qq php5 php5-fpm php5-mysql php5-curl

# configure PHP
grep -P -q ";?cgi\.fix_pathinfo" /etc/php5/fpm/php.ini && sed -i "s/;\?cgi\.fix_pathinfo.*/cgi.fix_pathinfo=0/g" /etc/php5/fpm/php.ini || echo "cgi.fix_pathinfo=0" | tee --append /etc/php5/fpm/php.ini > /dev/null

# restart php-fpm
service php5-fpm restart

# install composer package manager
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer