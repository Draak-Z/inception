SRCS 			= ./srcs
COMPOSE 		= cd srcs/ && docker compose
DATA_PATH 		= /home/bmaudet/data

.PHONY : all build up down pause unpause clean fclean re

all		:	build
			mkdir -p $(DATA_PATH)/wordpress
			mkdir $(DATA_PATH)/database
			$(COMPOSE) up -d

build	:
			$(COMPOSE) build

up:
			${COMPOSE} up -d 

down	:
			$(COMPOSE) down

pause:
			$(COMPOSE) pause

unpause:
			$(COMPOSE) unpause

pull:
			$(COMPOSE) pull

clean	:
			$(COMPOSE) down -v --rmi all --remove-orphans

fclean	:	clean
			docker system prune --volumes --all --force
			sudo rm -rf $(DATA_PATH)
			docker network prune --force
			docker image prune --force

re		:	fclean all

#docker stop $(docker ps -qa); docker rm $(docker ps -qa); docker rmi -f $(docker images -qa); docker volume rm $(docker volume ls -q); docker network rm $(docker ls -q) 2>/dev/null