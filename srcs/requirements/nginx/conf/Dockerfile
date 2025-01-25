# Using the debian oldstable image
FROM debian:oldstable

# Update and Upgrade already installed packages
RUN apt update -y && apt upgrade -y

# Install nginx the main application
RUN apt install nginx -y
# Install openssl to generate certificates to HTTPS
RUN apt install openssl -y
# Generating private key
RUN openssl genpkey -algorithm RSA -out /etc/ssl/private/private.key
# Generating certificate (public key)
RUN openssl req -x509 -sha256 -days 365 -key /etc/ssl/private/private.key \
    -out /etc/ssl/certs/certificate.crt \
    -subj "/C=BR/ST=SP/L=Sao Paulo/O=42sp/CN=myokogaw.42.fr"

# Copy nginx file conf to container for uses
COPY ./conf/default.conf /etc/nginx/conf.d

# Running nginx in foreground 
CMD ["nginx", "-g", "daemon off;"]
