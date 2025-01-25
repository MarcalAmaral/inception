FROM debian:oldstable

RUN apt update -y && apt upgrade -y
RUN apt install mariadb-server -y

COPY tools/create_wp_db.sh /tmp/create_wp_db.sh

RUN chmod 700 /tmp/create_wp_db.sh && bash /tmp/create_wp_db.sh

CMD ["mysqld_safe"]
