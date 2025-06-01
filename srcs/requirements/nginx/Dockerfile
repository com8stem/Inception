FROM debian:latest

RUN apt update && apt upgrade -y && apt install -y nginx openssl

RUN mkdir -p /run/nginx 
RUN mkdir -p /etc/nginx/ssl
RUN chown -R www-data:www-data /run/nginx

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/server.key \
    -out /etc/nginx/ssl/server.crt \
    -subj "/CN=DOMAIN_NAME"

COPY default /etc/nginx/sites-available/.
RUN ln -sf /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
