#!/bin/bash

mysql_install_db

/etc/init.d/mariadb stop

exec mysqld 
