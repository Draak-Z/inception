COMPOSE 		= cd srcs/ && docker compose

all		:
			sudo service nginx stop
			sudo service mysql stop
			$(COMPOSE) build
			mkdir -p /home/bmaudet/data/wordpress
			mkdir -p /home/bmaudet/data/mariadb
			$(COMPOSE) up -d

bonus:		fclean
			cd bonus/ && make

up:
			${COMPOSE} up -d 

down	:
			$(COMPOSE) down

pause:
			$(COMPOSE) pause

unpause:
			$(COMPOSE) unpause

clean	:
			$(COMPOSE) down -v --rmi all --remove-orphans

fclean	:	clean
			docker system prune --volumes --all --force
			sudo rm -rf /home/bmaudet/data
			docker network prune --force
			docker image prune --force

re		:	fclean all

.PHONY : all build up down pause unpause clean fclean re

#docker stop $(docker ps -qa); docker rm $(docker ps -qa); docker rmi -f $(docker images -qa); docker volume rm $(docker volume ls -q); docker network rm $(docker network ls -q) 2>/dev/null