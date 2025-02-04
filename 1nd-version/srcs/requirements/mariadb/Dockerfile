FROM debian:oldstable

RUN apt update -y && apt upgrade -y && apt install -y mariadb-server

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/.
OPY tools/script.sh .

RUN mkdir /run/mysqld && chmod 100 script.sh

CMD ["./script.sh"]
