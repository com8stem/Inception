#!/bin/bash

sleep 10

if [ ! -s wp-config.php ]; then
	wp --allow-root core download
	wp --allow-root config create \
		--dbname=${DB_NAME} \
		--dbuser=${DB_USER} \
		--dbpass=${DB_PASSWORD} \
		--dbhost=mariadb
	wp --allow-root core install \
		--url=${DOMAIN_NAME} \
		--title=inception \
		--admin_user=${ADMIN_USER} \
		--admin_password=${ADMIN_PASSWORD} \
		--admin_email=${ADMIN_EMAIL}
	wp --allow-root user create \
		${WP_USER} \
		${WP_EMAIL} \
		--user_pass=${WP_PASSWORD}
fi

exec "php-fpm8.2" -F
