# Define variables
DOCKER_COMPOSE = docker-compose -f docker-compose.dev.yml

DOCKER_FILE_HOT_RELOAD = dc-hot-reload.yml
DOCKER_FILE_LOCAL = docker-compose-local.yml
DOCKER_FILE_PROD = docker-compose-prod.yml

BACKEND_SERVICE = api
FRONTEND_SERVICE = nuxt
DATABASE_SERVICE = postgres

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
	@echo "  build       - Build Docker images"
	@echo "  up          - Start Docker containers"
	@echo "  down        - Stop Docker containers"
	@echo "  restart     - Restart Docker containers"
	@echo "  logs        - View Docker logs"
	@echo "  clean       - Remove Docker containers, networks, images, and volumes"

# Build Docker images
build:
	@echo "Building Docker images..."
	@docker-compose -f docker-compose.dev.yml build

# Start Docker containers
up: build
	@echo "Starting Docker containers..."
	@docker-compose -f docker-compose.dev.yml up -d

# Stop Docker containers
down:
	@echo "Stopping Docker containers..."
	@docker-compose -f docker-compose.dev.yml down

# Restart Docker containers
restart: down up

# View Docker logs
logs:
	@echo "Viewing logs for services..."
	@docker-compose -f docker-compose.dev.yml logs -f

# Clean Docker resources
clean:
	@echo "Removing Docker containers, networks, images, and volumes..."
	@docker-compose -f docker-compose.dev.yml down --rmi all --volumes --remove-orphans

.PHONY: help build up down restart logs clean
