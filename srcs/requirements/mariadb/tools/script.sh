#!/bin/bash

service mariadb start

# Creating database if not exists;
mariadb -u root -e "CREATE DATABASE IF NOT EXISTS ${DATABASE_NAME};"

# Creating administator user if not exists and give all privileges;
mariadb -u root -e "CREATE USER IF NOT EXISTS '${DATABASE_ADMIN}'@'%' IDENTIFIED BY '${DATABASE_ADMIN_PASS}';"
mariadb -u root -e "GRANT ALL PRIVILEGES ON ${DATABASE_NAME}.* TO '${DATABASE_ADMIN}'@'%' IDENTIFIED BY '${DATABASE_ADMIN_PASS}';"

# Apply changes;
mariadb -u root -e "FLUSH PRIVILEGES;"
