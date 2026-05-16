#!/bin/sh
set -e

set_env() {
  key="$1"
  value="$2"
  if grep -q "^${key}=" .env; then
    sed -i "s|^${key}=.*|${key}=${value}|" .env
  else
    echo "${key}=${value}" >> .env
  fi
}

if [ ! -f artisan ]; then
  composer create-project laravel/laravel /tmp/laravel-app --prefer-dist
  cp -a /tmp/laravel-app/. /var/www/html/
  rm -rf /tmp/laravel-app
fi

if [ ! -f .env ]; then
  cp .env.example .env
fi

set_env DB_CONNECTION "${DB_CONNECTION}"
set_env DB_HOST "${DB_HOST}"
set_env DB_PORT "${DB_PORT}"
set_env DB_DATABASE "${DB_DATABASE}"
set_env DB_USERNAME "${DB_USERNAME}"
set_env DB_PASSWORD "${DB_PASSWORD}"
set_env SESSION_DRIVER "${SESSION_DRIVER}"

composer install
php artisan config:clear

if ! grep -q '^APP_KEY=base64:' .env; then
  php artisan key:generate --force
fi

php artisan serve --host=0.0.0.0 --port=8000
