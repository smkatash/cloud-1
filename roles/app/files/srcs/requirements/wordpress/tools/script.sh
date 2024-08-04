#!/bin/bash

# download and extract WordPress core files to the specified path
wp core download --path=/var/www/wordpress --allow-root
# copy config files into container
cp /tmp/wp-config.php /var/www/wordpress/
cp /tmp/www.conf /etc/php/8.2/fpm/pool.d/www.conf
# read permission for default user and group of web server
chown -R www-data:www-data /var/www/wordpress/
chown -R www-data:www-data /var/www/wordpress/wp-content
chown -R www-data:www-data /var/www/wordpress/wp-content/plugins/
usermod -aG www-data www-data

# WP installation : Creates WP tables in the database using the URL, title, and default admin user details provided.
wp core install --url=$IP --title=$WP_TITLE --admin_user=$WP_DB_HOST --admin_password=$WP_HOST_PASSWORD --admin_email=$WP_HOST_EMAIL --skip-email --path=/var/www/wordpress --allow-root
wp plugin update --all --path=/var/www/wordpress --allow-root
wp user create $WP_USER $WP_USER_EMAIL --role=author --user_pass=$WP_USER_PASSWORD --path=/var/www/wordpress --allow-root

# excute php-fpm, set up daemonize to 'no' in the php-fpm.conf so that the Docker container itself can be run as daemon.
exec /usr/sbin/php-fpm8.2 --nodaemonize --fpm-config /etc/php/8.2/fpm/php-fpm.conf
