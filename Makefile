# init:
# 	pip install --upgrade pip
# 	pip install virtualenv
# 	python3.12 -m venv env
# 	source env/bin/activate
# 	pip install requirements.txt
# 	pip install "fastapi[standard]"


# Define variables
DOCKER_COMPOSE = docker-compose -f docker-compose.dev.yml
BACKEND_SERVICE = api
FRONTEND_SERVICE = nuxt
DATABASE_SERVICE = postgres

.PHONY: help build up down restart logs clean

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
