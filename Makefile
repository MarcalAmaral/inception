LOGIN = myokogaw

PATH_DOCKER_COMPOSE = srcs/docker-compose.yml

create_dirs:
	@sudo mkdir -p "/home/${LOGIN}/data/website"
	@sudo mkdir -p "/home/${LOGIN}/data/database"

append_hostname:
	@if ! sudo grep -q "${LOGIN}.42.fr" /etc/hosts; then \
		echo "127.0.0.1 ${LOGIN}.42.fr" | sudo tee -a /etc/hosts > /dev/null; \
	fi


all: create_dirs append_hostname up

up:
	docker compose -f ${PATH_DOCKER_COMPOSE} up --build -d

volumes:
	docker compose -f ${PATH_DOCKER_COMPOSE} volumes

clean:
	sudo sed -i "/myokogaw/d" /etc/hosts
	sudo rm -rf "/home/${LOGIN}"
	docker compose -f ${PATH_DOCKER_COMPOSE} down
	docker system prune -a

.DEFAULT_GOAL = all
