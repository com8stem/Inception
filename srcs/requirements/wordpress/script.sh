#!/bin/bash

cd /var/www/html

rm -rf ./*

curl -o wp-cli.phar https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
./wp-cli.phar core download --allow-root
./wp-cli.phar config create --dbname=wordpress --dbuser="$WORDPRESS_DB_USER" --dbpass="$WORDPRESS_DB_PASSWORD" --dbhost=mariadb --allow-root

./wp-cli.phar config set DISALLOW_FILE_EDIT false --allow-root
./wp-cli.phar config set DISALLOW_FILE_MODS false --allow-root
./wp-cli.phar config set FS_METHOD direct --allow-root

./wp-cli.phar core install --url=kishizu.42.fr --title=inception --admin_user=admin --admin_password=admin --admin_email=admin@admin.com --allow-root --skip-email

chown -R www-data:www-data /var/www/html
php-fpm8.2 -F
