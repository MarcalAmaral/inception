#!/bin/bash

wget -O /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod 100 /usr/local/bin/wp
wp core download --allow-root
wp config create \
	--dbname=${WP_DATABASE} \
	--dbuser=wpuser \
	--dbpass=password \
	--dbhost=mariadb \
	--allow-root
wp core install \
	--url=localhost \
	--title=inception \
	--admin_user=admin \
	--admin_password=admin \
	--admin_email=admin@admin.com \
	--allow-root

wp --allow-root theme activate twentytwentyfour

php-fpm7.4 -F
