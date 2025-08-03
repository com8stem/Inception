FROM debian:latest

RUN apt update && apt install -y php-fpm php-mysql curl mariadb-client

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp; \
	mkdir -p /var/www/html && \
	chown -R www-data:www-data /var/www/html && \
	chmod -R +x /var/www/html;

COPY www.conf /etc/php/8.2/fpm/pool.d/
RUN mkdir -p /run/php
COPY script.sh /
RUN chmod +x script.sh

EXPOSE 9000
ENTRYPOINT [ "/script.sh" ]
WORKDIR /var/www/html
CMD ["php-fpm8.2", "-F"]
