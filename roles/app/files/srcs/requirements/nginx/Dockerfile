FROM		debian:bookworm

# installation of necessary packages
RUN			apt-get update && apt-get install -y \
			dumb-init \
			nginx \
			openssl

# get ssl
RUN			openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:2048 -subj \
			"/C=FR/ST=France/O=42/CN=ktashbae.42.fr" \
			-keyout /etc/ssl/private/ktashbae.key -out /etc/ssl/certs/ktashbae.crt

# copy config file into container
COPY		./conf.d/nginx.conf /etc/nginx/nginx.conf
RUN			rm /etc/nginx/sites-enabled/default

# a simple process supervisor and init system designed to run as PID 1 inside
ENTRYPOINT  ["/usr/bin/dumb-init"]

# Keeps the logs free of messages about not being able to bind().
CMD			["nginx", "-g", "daemon off;"]

# opessl request
# -newkey arg :  creates a new certificate request and a new private key. 
# The argument takes one of several forms. rsa:nbits, where nbits is the number of bits, 
# generates an RSA key nbits in size. 
# -new: generates a new certificate request
# -nodes: if a private key is created it will not be encrypted.
# -x509: a self signed certificate instead of a certificate request. 
# -days n : when the -x509 option is being used this specifies the number of 
# days to certify the certificate for.
# -keyout [filename] :  filename to write the newly created private key to.
# -out filename: the output filename to write to or standard output by default
# -.crt is a certificate 
# - subj arg: replaces subject field of input request with specified data and outputs 
# modified request.