FROM		debian:buster

# installation of necessary packages
RUN			apt-get update && apt-get install -y \
			dumb-init \
			nginx \
			openssl

# copy config file into container
COPY		./conf.d/nginx.conf /etc/nginx/nginx.conf
RUN			rm /etc/nginx/sites-enabled/default

ENTRYPOINT  ["/usr/bin/dumb-init"]

CMD			["nginx", "-g", "daemon off;"]
