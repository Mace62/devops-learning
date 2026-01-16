#!/bin/bash
set -euxo pipefail
export DEBIAN_FRONTEND=noninteractive

apt-get update -y
apt-get install -y apache2 mysql-server php php-mysql libapache2-mod-php unzip wget

systemctl enable --now apache2
systemctl enable --now mysql

# Prefer index.php over index.html
sed -i 's/DirectoryIndex .*/DirectoryIndex index.php index.html index.cgi index.pl index.xhtml index.htm/' \
  /etc/apache2/mods-enabled/dir.conf

# Download WordPress
cd /tmp
wget -q https://wordpress.org/latest.tar.gz
tar -xzf latest.tar.gz

# Deploy WordPress (remove Apache default page)
rm -rf /var/www/html/*
cp -r /tmp/wordpress/* /var/www/html/

# Marker so you can confirm user-data ran
echo "cloud-init ran at $(date -Is)" > /var/www/html/BOOTSTRAP_OK.txt

chown -R www-data:www-data /var/www/html

systemctl restart apache2
