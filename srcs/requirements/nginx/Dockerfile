FROM debian:latest

RUN apt update && apt upgrade -y && apt install -y nginx openssl tini

# NGINX が起動する際に必要なディレクトリを作成
RUN mkdir -p /run/nginx 
RUN mkdir -p /etc/nginx/ssl
RUN chown -R www-data:www-data /run/nginx

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/server.key \
    -out /etc/nginx/ssl/server.crt \
    -subj "/CN=kishizu.42.fr"

# # ホスト側の設定ファイルをコピー
# COPY conf/default.conf /etc/nginx/conf.d/default.conf

COPY default /etc/nginx/sites-available/.
RUN ln -sf /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default


EXPOSE 443

ENTRYPOINT ["/usr/bin/tini", "--"]

# NGINX をフォアグラウンドで実行
CMD ["nginx", "-g", "daemon off;"]
