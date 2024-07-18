NAME = inception

$(NAME):
			sudo mkdir -p /home/ktashbae/data/db
			sudo mkdir -p /home/ktashbae/data/wordpress
			sudo docker-compose -f ./srcs/docker-compose.yml up -d --build

all:  $(NAME)

set_up:		ansible-playbook -i inventory playbooks/install_docker.yaml

build:
			sudo docker-compose build
up:
			sudo docker-compose -f ./srcs/docker-compose.yml up -d --build

down:
			sudo docker-compose -f ./srcs/docker-compose.yml down

clean:
			sudo docker-compose -f ./srcs/docker-compose.yml down -v --rmi all --remove-orphans

fclean:		clean
			sudo rm -rf /home/ktashbae/data/db
			sudo rm -rf /home/ktashbae/data/wordpress
			sudo docker system prune --volumes --all --force
			sudo docker network prune --force
			sudo docker volume prune --force
