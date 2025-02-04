FROM debian:oldstable

RUN apt update -y \
	&& apt upgrade -y \
	&& apt install -y nginx \
	&& apt install -y ssl-cert

COPY conf/default /etc/nginx/sites-enabled/default
COPY conf/nginx.conf /etc/nginx/nginx.conf

CMD ["nginx", "-g", "daemon off;"]
