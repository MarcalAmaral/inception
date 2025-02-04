#!/bin/bash
exec > /tmp/wp_log 2>&1

# Download wp-cli if not exists
if [ ! -f /usr/local/bin/wp ]; then
    wget -O /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x /usr/local/bin/wp
fi

# WordPress setup
wp core download --allow-root --path=/var/www/html

wp config create \
    --allow-root \
    --path=/var/www/html \
    --dbname=${DATABASE_NAME} \
    --dbuser=${DATABASE_ADMIN} \
    --dbpass=${DATABASE_ADMIN_PASS} \
    --dbhost=mariadb \
    --debug || echo "wp config create failed!"

wp core install \
    --allow-root \
    --path=/var/www/html \
    --url=${URL} \
    --title=${TITLE} \
    --admin_user=${WORDPRESS_ADMIN} \
    --admin_password=${WORDPRESS_ADMIN_PASS} \
    --admin_email=${WORDPRESS_ADMIN_EMAIL} || echo "wp core install failed!"

wp --allow-root theme activate twentytwentyfour || echo "Theme activation failed!"

wp --allow-root user create amaral amaral@email.com --role=editor --user_pass=$WORDPRESS_USER_PASS
unset DATABASE_NAME DATABASE_ADMIN DATABASE_ADMIN_PASS URL TITLE WORDPRESS_ADMIN WORDPRESS_ADMIN_PASS WORDPRESS_ADMIN_EMAIL

exec php-fpm7.4 -F
