COMPOSE=docker compose
FILE=-f docker-compose.yml

compose-setup:
	$(COMPOSE) run --rm app make setup

compose-up-exist:
	$(COMPOSE) up --abort-on-container-exist

compose-start:
	$(COMPOSE) up

compose-down:
	$(COMPOSE) down

compose-ci:
	$(COMPOSE) ${FILE} up --abort-on-container-exit

compose-test:
	$(COMPOSE) ${FILE} up --abort-on-container-exit --exit-code-from app

compose-ci-build:
	$(COMPOSE) ${FILE} build app

compose-push:
	$(COMPOSE) ${FILE} push app

up-development:
	docker run -p 8080:8080 -e NODE_ENV=development valrythx/devops-for-developers-project-74 make dev
