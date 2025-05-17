FROM debian:latest

RUN apt update && apt upgrade -y && \
    apt install -y mariadb-server

ENV DEBIAN_FRONTEND=noninteractive

COPY 50-server.cnf /etc/mysql/mariadb.conf.d/.
COPY init.sql /etc/mysql/init.sql
COPY script.sh .

RUN mkdir /run/mysqld && chmod +x script.sh

EXPOSE 3306

CMD [ "./script.sh" ]