### Hexlet tests and linter status:
[![Actions Status](https://github.com/despot84/devops-for-developers-project-74/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/despot84/devops-for-developers-project-74/actions)
[![ci](https://github.com/kkirilltarasenko/devops-for-developers-project-74/actions/workflows/push.yml/badge.svg)](https://github.com/kkirilltarasenko/devops-for-developers-project-74/actions/workflows/push.yml)

## Требования к системе
- Docker и Docker Compose

### Инструкция по установке Docker
[Install Docker Engine](https://docs.docker.com/engine/install/)

## Docker образ
https://hub.docker.com/repository/docker/valrythx/devops-for-developers-project-74

## Как запустить приложение
1. Клонируйте репозиторий:
   ```bash
   git clone git@github.com:kkirilltarasenko/devops-for-developers-project-74/.git
   cd js-fastify-blog
   ```
2. Создайте файл .env на основе .env.example и заполните его необходимыми данными.
3. Запустить docker-compose 
```
docker-compose up
```
Откройте http://localhost


## Commands
Setup

```bash
make setup
```

Test

```bash
make test
```

Run (development)
```bash
make dev
```

Build (production)

```bash
make prod-build
```

Push docker image

```bash
make prod-push
```

### Запуск приложения используя Postgres (test)
Для запуска тестов с Postgres необходимо отредактировать файл config/config.cjs и в ключе test закомментировать использование SQLite и раскомментировать переменные окружения.
```
  // test: {
  //   dialect: 'sqlite',
  //   storage: './database.test.sqlite',
  // },
  test: {
    dialect: 'postgres',
    database: process.env.DATABASE_NAME,
    username: process.env.DATABASE_USERNAME,
    password: process.env.DATABASE_PASSWORD,
    port: process.env.DATABASE_PORT,
    host: process.env.DATABASE_HOST,
  },
```
Укажите данные для подключения к базе данных.
```
DATABASE_NAME=postgres
DATABASE_USERNAME=postgres
DATABASE_PASSWORD=postgres
DATABASE_PORT=5432
DATABASE_HOST=localhost
```

### Запуск приложения используя Postgres (production)
Экспортируйте переменные среды для работы с базой данных или подготовьте файл .env с переменными
```
make ci-build
make push
make start
```
