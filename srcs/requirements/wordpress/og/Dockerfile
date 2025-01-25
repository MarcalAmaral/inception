FROM debian:oldstable

RUN apt update -y && apt upgrade -y
RUN apt install -y php-fpm \
	php-mysql \
	php-cli \
	php-curl \
	php-xml \
	php-mbstring \
	php-zip \
	wget \
	unzip \
	mariadb-client -y && rm -rf var/lib/apt/lists/*

RUN wget https://wordpress.org/latest.tar.gz -O /tmp/wordpress.tar.gz \
	&& tar -xvzf /tmp/wordpress.tar.gz -C /var/www/ \
	&& mv /var/www/wordpress/* /var/www/html/ \
	&& rm -rf /var/www/wordpress /tmp/wordpress.tar.gz

RUN chown -R www-data:www-data /var/www/html

EXPOSE 9000

CMD["php-fpm8.4", "-F"]
