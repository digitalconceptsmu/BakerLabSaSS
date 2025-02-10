DOCKER_COMPOSE = docker compose
APP_CONTAINER = app

######## DEV #########################
# Setup project on dev environment
init-dev:
	$(DOCKER_COMPOSE) -f docker-compose.dev.yml up --build -d
	make migrate
	make seed

# Run the application on dev environment
start-dev:
	$(DOCKER_COMPOSE) -f docker-compose.dev.yml up -d

# Stop the application on dev environment
stop-dev:
	$(DOCKER_COMPOSE) -f docker-compose.dev.yml down

clean-dev:
	$(DOCKER_COMPOSE) -f docker-compose.dev.yml down -v

# Run Prisma migration on dev environment
migrate:
	$(DOCKER_COMPOSE) exec $(APP_CONTAINER) npx prisma generate
	$(DOCKER_COMPOSE) exec $(APP_CONTAINER) npx prisma migrate deploy

# Populate database with fixtures on dev environment
seed:
	$(DOCKER_COMPOSE) exec $(APP_CONTAINER) npx prisma db seed