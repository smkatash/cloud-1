#!/bin/bash

# read permission for default user and group of sql
chown -R mysql:mysql /var/lib/mysql
# bind to listen to all interfaces
sed -i "s|.*bind-address\s*=.*|bind-address=0.0.0.0|" /etc/mysql/mariadb.conf.d/50-server.cnf
# uncomment port
sed -i "s|#port|port |" /etc/mysql/mariadb.conf.d/50-server.cnf

# start sql, login as root and create database, user and set root password
service mysql start

mysql --user=$DB_ROOT << EOF
CREATE DATABASE IF NOT EXISTS $DB_NAME;
CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_USER_PWD';
GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_USER_PWD' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON *.* TO '$DB_ROOT'@'%' IDENTIFIED BY '$DB_ROOT_PWD';
FLUSH PRIVILEGES;

UPDATE mysql.user SET Password=PASSWORD('$DB_ROOT_PWD') WHERE User='$DB_ROOT';
UPDATE mysql.user SET plugin = '' WHERE User = '$DB_ROOT' AND host = 'localhost';
EOF

sleep 15
service mysql stop

# mysqld_safe is the recommended way to start a mysqld server on Unix. 
# mysqld_safe adds some safety features such as restarting the server 
# when an error occurs and logging runtime information to an error log.
exec mysqld_safe