FROM debian:bullseye

# 対話的なプロンプトを無効にする
ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && \
    apt install -y mariadb-server tini && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/run/mysqld && chown mysql:mysql /var/run/mysqld

# エントリーポイントスクリプトをコンテナ内にコピー
COPY ./tools/setup.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

COPY conf/default.conf /etc/mysql/mariadb.conf.d/50-server.cnf

EXPOSE 3306

ENTRYPOINT ["/usr/bin/tini", "--", "/entrypoint.sh"]
