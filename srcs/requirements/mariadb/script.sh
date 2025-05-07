#!/bin/bash

mysql_install_db

/etc/init.d/mariadb stop

sed -i 's/^bind-address/#bind-address/g' /etc/mysql/mariadb.conf.d/50-server.cnf

exec mysqld 
