if [ ! -f ".tmp" ]; then

	usr/bin/mysqld_safe --datadir=/var/lib/mysql &

	while ! mysqladmin ping -h "$MARIADB_HOST" --silent; do
    	sleep 1
	done

	eval "echo \"$(cat /tmp/create_db.sql)\"" | mariadb
	touch .tmp
fi

usr/bin/mysqld_safe --datadir=/var/lib/mysql