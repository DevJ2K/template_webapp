# Define variables

DOCKER_FILE_HOT_RELOAD = dc-hot-reload.yml
DOCKER_FILE_LOCAL = docker-compose-local.yml
DOCKER_FILE_PROD = docker-compose-prod.yml

DOCKER_FILE = $(DOCKER_FILE_HOT_RELOAD)

########################################
########## COLORS
DEF_COLOR = \033[0;39m
GRAY = \033[1;90m
RED = \033[1;91m
GREEN = \033[1;92m
YELLOW = \033[1;93m
BLUE = \033[1;94m
MAGENTA = \033[1;95m
CYAN = \033[1;96m
WHITE = \033[1;97m


# Default target
help:
	@echo "$(MAGENTA)→$(WHITE) $(GREEN)run         $(BLUE)-$(WHITE) Build Docker images and Start Docker containers"
	@echo ""
	@echo "$(MAGENTA)→$(WHITE) build       $(BLUE)-$(WHITE) Build Docker images"
	@echo "$(MAGENTA)→$(WHITE) up          $(BLUE)-$(WHITE) Start Docker containers"
	@echo "$(MAGENTA)→$(WHITE) down        $(BLUE)-$(WHITE) Stop Docker containers"
	@echo "$(MAGENTA)→$(WHITE) restart     $(BLUE)-$(WHITE) Restart Docker containers"
	@echo "$(MAGENTA)→$(WHITE) logs        $(BLUE)-$(WHITE) View Docker logs"
	@echo "$(MAGENTA)→$(WHITE) clean       $(BLUE)-$(WHITE) Remove Docker containers, networks, images, and volumes$(RESET)"

run: build up

# Build Docker images
build:
	@echo "$(BLUE)Building Docker images...$(RESET)"
	@docker-compose -f $(DOCKER_FILE) build

# Start Docker containers
up:
	@echo "$(YELLOW)Starting Docker containers...$(RESET)"
	@docker-compose -f $(DOCKER_FILE) up -d
	@clear
	@while [ $$(docker-compose -f $(DOCKER_FILE) logs signature --no-log-prefix | wc -l) -eq 0 ]; do \
		sleep 0.1; \
	done
	@docker-compose -f $(DOCKER_FILE) logs signature --no-log-prefix

# Stop Docker containers
down:
	@echo "$(RED)Stopping Docker containers...$(RESET)"
	@docker-compose -f $(DOCKER_FILE) down

# Restart Docker containers
restart: down up

# View Docker logs
logs:
	@echo "$(GRAY)Viewing logs for services...$(RESET)"
	@docker-compose -f $(DOCKER_FILE) logs -f

# Clean Docker resources
clean:
	@echo "$(RED)Removing Docker containers, networks, images, and volumes...$(RESET)"
	@docker-compose -f $(DOCKER_FILE) down --rmi all --volumes --remove-orphans
# docker rmi -f $(docker images -qa)
# docker rm -v -f $(docker ps -qa)

.PHONY: help build up down restart logs clean
