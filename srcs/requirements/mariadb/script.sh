#!/bin/bash

mysql_install_db

/etc/init.d/mariadb stop

mysqld_safe & sleep 10

mysql -e "CREATE DATABASE wordpress;"
mysql -e "CREATE USER '$WORDPRESS_DB_USER'@'%' IDENTIFIED BY '$WORDPRESS_DB_PASSWORD';"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO '$WORDPRESS_DB_USER'@'%' WITH GRANT OPTION;"
mysql -e "CREATE USER '$WORDPRESS_DB_USER2'@'%' IDENTIFIED BY '$WORDPRESS_DB_PASSWORD2';"
mysql -e "GRANT SELECT, LOCK TABLES, SHOW VIEW ON *.* TO '$WORDPRESS_DB_USER2'@'%';"
mysql -e "FLUSH PRIVILEGES;"

pkill mysqld
sleep 5

exec mysqld 
