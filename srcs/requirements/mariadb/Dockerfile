FROM	alpine:3.14

RUN		apk update

RUN		apk add --no-cache --quiet --update mariadb mariadb-client vim

COPY	./conf/create_db.sql /tmp/create_db.sql

COPY 	./conf/mariadb-server.cnf /etc/my.cnf.d/

COPY	./tools/entrypoint.sh ./

RUN 	chmod +x ./entrypoint.sh

RUN 	mkdir -p /var/lib/mysqld /run/mysqld

RUN		mariadb-install-db --datadir=/var/lib/mysql \
			--auth-root-authentication-method=normal

RUN		chown -R mysql:mysql /var/lib/mysql 

RUN 	chown -R mysql:mysql /run/mysqld

ENTRYPOINT [ "sh", "entrypoint.sh" ]