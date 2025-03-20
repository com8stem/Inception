FROM debian:latest

RUN apt-get update && apt-get install -y \
	apache2 \
	php \
	libapache2-mod-php \
	wget \
	&& rm -rf /var/lib/apt/lists/*
	RUN apt-get update && apt-get install -y php-mysql && rm -rf /var/lib/apt/lists/*
	ENV ADMINER_DEFAULT_SERVER=mariadb

RUN wget "https://www.adminer.org/latest.php" -O /var/www/html/adminer.php \
	&& ln -s /var/www/html/adminer.php /var/www/html/index.php

EXPOSE 80

# Start Apache in the foreground
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]