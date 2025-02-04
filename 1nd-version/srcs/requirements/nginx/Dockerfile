FROM debian:oldstable

RUN apt update -y && apt upgrade -y && apt install -y nginx openssl
RUN openssl genpkey -algorithm RSA -out /etc/ssl/private/private.key
RUN openssl req -x509 -sha256 -days 365 -key /etc/ssl/private/private.key \
    -out /etc/ssl/certs/certificate.crt \
    -subj "/C=BR/ST=SP/L=Sao Paulo/O=42sp/CN=myokogaw.42.fr"

COPY conf/default /etc/nginx/sites-available/.

CMD ["nginx", "-g", "daemon off;"]
