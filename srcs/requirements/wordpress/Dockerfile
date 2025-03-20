FROM debian:bullseye

RUN apt update && apt install -y \
    php7.4-fpm php7.4-mysql php7.4-cli php7.4-curl php7.4-gd php7.4-xml php7.4-mbstring \
    wget unzip \
    && rm -rf /var/lib/apt/lists/*

# php-fpm の実行ファイルが確実に PATH に含まれるようシンボリックリンクを作成
RUN ln -s /usr/sbin/php-fpm7.4 /usr/local/bin/php-fpm

WORKDIR /tmp
RUN wget https://wordpress.org/latest.tar.gz && tar -zxf latest.tar.gz && rm latest.tar.gz && mkdir -p /var/www/html && cp -r wordpress/* /var/www/html

# WordPress の設置先ディレクトリに移動し、所有権を www-data に変更
WORKDIR /var/www/html
RUN chown -R www-data:www-data /var/www/html
RUN chmod -R 755 /var/www/html

RUN mkdir -p /run/php

EXPOSE 9000

COPY conf/default.conf /etc/php/7.4/fpm/pool.d/www.conf

# php-fpm をフォアグラウンドで実行
CMD ["php-fpm", "-F"]
