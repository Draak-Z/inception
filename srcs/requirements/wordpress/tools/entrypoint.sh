grep -E "listen = 127.0.0.1" $FILE > /dev/null 2>&1

if [ $? -eq 0 ]; then
	sed -i "s|.*listen = 127.0.0.1.*|listen = 9000|g" $FILE
	echo "env[MARIADB_HOST] = \$MARIADB_HOST" >> $FILE
	echo "env[MARIADB_USER] = \$MARIADB_USER" >> $FILE
	echo "env[MARIADB_PWD] = \$MARIADB_PWD" >> $FILE
	echo "env[MARIADB_DB] = \$MARIADB_DB" >> $FILE
fi

if [ ! -f "wp-config.php" ]; then

	cp /conf/wp-config ./wp-config.php

	sleep 5 

	wp core install --url="$WP_URL" --title="$WP_TITLE" --admin_user="$WP_ADMIN_USER" \
    	--admin_password="$WP_ADMIN_PWD" --admin_email="$WP_ADMIN_EMAIL" --skip-email

	wp plugin update --all

	wp theme install twentysixteen --activate

	wp user create $WP_USER $WP_USER_EMAIL --role=editor --user_pass=$WP_USER_PWD

	wp post generate --count=3 --post_title="Hello"
fi

php-fpm7 --nodaemonize