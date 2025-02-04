FROM debian:oldstable

RUN apt update -y && apt upgrade -y && apt install -y \
	php-fpm \
	php-mysqli \
	wget

RUN mkdir /run/php

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/.
COPY tools/wp_site.sh .

RUN chmod 100 wp_site.sh

CMD ["./wp_site.sh"]


