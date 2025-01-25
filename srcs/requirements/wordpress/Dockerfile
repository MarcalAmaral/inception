FROM debian:oldstable

RUN apt update -y && apt upgrade -y && apt install -y \
	php-fpm \
	php-mysqli \
	curl

RUN mkdir /run/php

COPY www.conf /etc/php/7.4/fpm/pool.d/.
COPY wp_site.sh .

RUN chmod 777 wp_site.sh

CMD ["./wp_site.sh"]


