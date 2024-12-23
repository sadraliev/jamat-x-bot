.PHONY: build

include .env
include .env.development.local

build:
	npm run rimraf
	npm run build

dev:
	make build
	npm run start:dev
set-webhook:
	curl -X POST "https://api.telegram.org/bot${TELEGRAM_BOT_TOKEN}/setWebhook?url=${HOST_URL}/${TELEGRAM_BOT_TOKEN}"
get-webhook-info:
	curl "https://api.telegram.org/bot${TELEGRAM_BOT_TOKEN}/getWebhookInfo"

up:
	docker-compose up -d
certbot-dry-run:
	docker compose run --rm certbot certonly --webroot -w /var/www/certbot/ -d api.dev.jaamat.exchange --dry-run
reload-nginx:
	docker compose exec nginx nginx -s reload
