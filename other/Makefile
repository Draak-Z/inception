SRCS 			= ./srcs
DOCKER			= sudo docker
COMPOSE 		= cd srcs/ && docker-compose
DATA_PATH 		= /home/bmaudet/data

.PHONY : all build up down pause unpause clean fclean re

all		:	build
			sudo mkdir -p $(DATA_PATH)
			sudo mkdir -p $(DATA_PATH)/wordpress
			sudo mkdir -p $(DATA_PATH)/database
			sudo chmod 777 /etc/hosts
			sudo echo "127.0.0.1 bmaudet.42.fr" >> /etc/hosts
			sudo echo "127.0.0.1 www.bmaudet.42.fr" >> /etc/hosts
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

clean	:
			$(COMPOSE) down -v --rmi all --remove-orphans

fclean	:	clean
			$(DOCKER) system prune --volumes --all --force
			sudo rm -rf $(DATA_PATH)
			$(DOCKER) network prune --force
			echo docker volume rm $(docker volume ls -q)
			$(DOCKER) image prune --force

# $(DOCKER) volume prune --force
re		:	fclean all

correc	:
			@ docker stop $(docker ps -qa); docker rm $(docker ps -qa); docker rmi -f $(docker images -qa); docker volume rm $(docker volume ls -q); docker network rm $(docker ls -q) 2>/dev/null