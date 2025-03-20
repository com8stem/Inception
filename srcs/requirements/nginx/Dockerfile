FROM debian:bullseye

RUN apt update && apt install -y nginx openssl tini

# NGINX が起動する際に必要なディレクトリを作成
RUN mkdir -p /run/nginx /etc/nginx/ssl

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/server.key \
    -out /etc/nginx/ssl/server.crt \
    -subj "/CN=localhost"

# ホスト側の設定ファイルをコピー
COPY conf/default.conf /etc/nginx/conf.d/default.conf

EXPOSE 443

ENTRYPOINT ["/usr/bin/tini", "--"]

# NGINX をフォアグラウンドで実行
CMD ["nginx", "-g", "daemon off;"]
