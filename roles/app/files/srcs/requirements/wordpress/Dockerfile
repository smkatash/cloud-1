FROM		debian:bookworm

# copy predefined scripts to tmp of container, data are cleared upon machine restart.
COPY	./tools/script.sh /tmp/
COPY	./conf/www.conf /tmp/
COPY	./conf/wp-config.php /tmp/

# installation of necessary packages
RUN		apt-get update && apt-get install -y \ 
		php7.3 \
		php-fpm \
		php-cli \
		php-mysql \
		curl \
		mariadb-client \
		bash \
		dumb-init

# set config of php https://gist.github.com/excid3/3669e021f005e0f62900aeb980bc890d
RUN		mkdir -p /var/www/wordpress
RUN		mkdir -p /run/php

# install WP-CLI, command line tool for interacting with and managing WordPress sites.
RUN		curl -s -L https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar --output /usr/bin/wp
# rights for execution
RUN 	chmod +x /usr/bin/wp

# a simple process supervisor and init system designed to run as PID 1 inside
ENTRYPOINT	["/usr/bin/dumb-init"]

# execute script
CMD			["bash", "/tmp/script.sh"]

