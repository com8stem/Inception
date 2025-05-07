FROM debian:latest

RUN apt update && apt upgrade -y && \
    apt install -y mariadb-server tini
    # rm -rf /var/lib/apt/lists/*

	# 対話的なプロンプトを無効にする
ENV DEBIAN_FRONTEND=noninteractive

# RUN mkdir -p /var/run/mysqld && chown mysql:mysql /var/run/mysqld

# エントリーポイントスクリプトをコンテナ内にコピー
# COPY ./tools/setup.sh /entrypoint.sh
# RUN chmod +x /entrypoint.sh

COPY 50-server.cnf /etc/mysql/mariadb.conf.d/.
COPY init.sql /etc/mysql/init.sql
COPY script.sh .

RUN mkdir /run/mysqld && chmod +x script.sh

EXPOSE 3306

# ENTRYPOINT ["/usr/bin/tini", "--", "/entrypoint.sh"]

CMD [ "./script.sh" ]