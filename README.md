# Упаковка в Docker Compose

[![hexlet-check](https://github.com/a-shein/devops-for-developers-project-74/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/a-shein/devops-for-developers-project-74/actions)
[![push](https://github.com/a-shein/devops-for-developers-project-74/actions/workflows/push.yml/badge.svg)](https://github.com/a-shein/devops-for-developers-project-74/actions/workflows/push.yml)

Автоматизация развертывания и обновления локального окружения с помощью Docker Compose, Github Actions (CI), Makefile

Учебный проект Хекслета: https://ru.hexlet.io/programs/devops-for-developers
Как это должно работать: https://asciinema.org/a/zVrFYtslVReMsTyqEEetdWUY5

## Стек

- Docker, Docker Compose
- Node.js 26, pnpm
- Fastify, Drizzle ORM
- PostgreSQL (локально — PGlite, embedded Postgres без установки)
- Caddy (reverse proxy, TLS)
- Vite, Vitest
- GitHub Actions (CI/CD)

## Требования

- Docker Engine и Docker Compose v2 (`docker compose`)
- Свободные порты `80`, `443`, `8080`, `5432` на хосте
- Локальная установка Node.js/pnpm не нужна — всё собирается внутри контейнеров

## Установка

```bash
git clone https://github.com/a-shein/devops-for-developers-project-74.git
cd devops-for-developers-project-74
```

Переменные окружения для подключения к Postgres задаются в `app/.env` (не коммитится, пример — `app/.env.example`):

```
DATABASE_HOST=db
DATABASE_NAME=postgres
DATABASE_USERNAME=postgres
DATABASE_PASSWORD=password
```

Без этого файла приложение само поднимает встроенный PGlite (Postgres в памяти процесса) — ставить реальную базу для разработки не обязательно.

## Использование

Подготовка проекта (установка зависимостей и сборка фронтенда внутри контейнера):

```bash
make setup
```

Запуск (приложение + Postgres + Caddy):

```bash
make dev
```

Приложение доступно на `https://localhost` (самоподписной сертификат) или `http://localhost`, напрямую на Fastify — `http://localhost:8080`.

Запуск тестов (внутри Docker, на той же продакшен-сборке, что уходит в Docker Hub):

```bash
make test
```

Собранный образ приложения публикуется в Docker Hub: [`ashein93/devops-for-developers-project-74`](https://hub.docker.com/r/ashein93/devops-for-developers-project-74) (тег `latest`), сборка и пуш — через `.github/workflows/push.yml` при каждом пуше в `main`.

---

<details>
<summary>Автоматические тесты Хекслета</summary>

Тесты запускаются на каждый коммит. За запуск отвечает файл `.github/workflows/hexlet-check.yml` — не удаляйте и не переименовывайте ни его, ни репозиторий.

</details>

## О Хекслете

[Хекслет](https://ru.hexlet.io/) — школа программирования: авторские программы обучения с практикой, поддержкой наставников и реальными проектами, которые остаются в резюме. Этот репозиторий — один из таких проектов.
