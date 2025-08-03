FROM debian:latest

RUN apt update && apt install -y mariadb-server bash

COPY 50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY script.sh /

RUN chmod 777 /script.sh
RUN mkdir -p /var/lib/mysql /run/mysqld; \
    chown -R mysql:mysql /var/lib/mysql /run/mysqld

EXPOSE 3306

ENTRYPOINT [ "/script.sh" ]
CMD ["mariadbd"]