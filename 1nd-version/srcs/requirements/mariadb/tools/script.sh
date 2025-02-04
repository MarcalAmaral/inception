#!/usr/bin/env bash

service mariadb start

mariadb -u root -e \
    "CREATE DATABASE IF NOT EXISTS ${WP_DATABASE}; \
    CREATE USER '${ADMIN_USER}'@'%' IDENTIFIED BY '${ADMIN_PASSWORD}'; \
    GRANT ALL ON ${WP_DATABASE}.* TO '${ADMIN_USER}'@'%' IDENTIFIED BY '${ADMIN_PASSWORD}'; \
    FLUSH PRIVILEGES;"
