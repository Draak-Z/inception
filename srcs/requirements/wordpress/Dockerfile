FROM	alpine:3.14

RUN		apk update

RUN		apk add --no-cache --quiet --update curl bash vim
RUN		apk add --no-cache --quiet --update mariadb-client
RUN		apk add --no-cache --quiet --update php7 php-fpm php-phar php-json php-mysqli php-iconv

RUN		mkdir -p /var/www/wordpress 

RUN		curl https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
			--output /usr/bin/wp 

RUN		chmod +x ./usr/bin/wp 

RUN		wp core download --path=/var/www/wordpress

WORKDIR /var/www/wordpress

COPY	conf/wp-config /conf/wp-config

COPY	./tools/entrypoint.sh /tmp/entrypoint.sh

RUN		chmod +x /tmp/entrypoint.sh

ENTRYPOINT ["sh", "/tmp/entrypoint.sh"]