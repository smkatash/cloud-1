#!bin/bash/

# download and extract WordPress core files to the specified path
wp core download --path=/var/www/wordpress --allow-root
# copy config files into container
cp /tmp/wp-config.php /var/www/wordpress/
cp /tmp/www.conf /etc/php/7.3/fpm/pool.d/www.conf
# read permission for default user and group of web server
chown -R www-data:www-data /var/www/wordpress/
chown -R www-data:www-data /var/www/wordpress/wp-content
chown -R www-data:www-data /var/www/wordpress/wp-content/plugins/
usermod -aG www-data www-data
#sed -i -e "s|;daemonize = yes|daemonize = no|g" /etc/php/7.3/fpm/php-fpm.conf
# WP installation : Creates WP tables in the database using the URL, title, and default admin user details provided.
wp core install --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_DB_HOST --admin_password=$WP_HOST_PASSWORD --admin_email=$WP_HOST_EMAIL --skip-email --path=/var/www/wordpress --allow-root
wp plugin update --all --path=/var/www/wordpress --allow-root
wp user create $WP_USER $WP_USER_EMAIL --role=author --user_pass=$WP_USER_PASSWORD --path=/var/www/wordpress --allow-root
#exec /usr/sbin/php-fpm7.3
# excute php-fpm, set up daemonize to 'no' in the php-fpm.conf so that the Docker container itself can be run as daemon.

exec /usr/sbin/php-fpm7.3 --nodaemonize --fpm-config /etc/php/7.3/fpm/php-fpm.conf
