# docker-laravel

Plantilla base para levantar Laravel (última versión) con Docker, MariaDB y Vite con HMR.

## Archivos base

- `Dockerfile`
- `docker-compose.yml`
- `docker/start-app.sh`
- `docker/start-vite.sh`
- `.env.example`
- `vite.config.js`

## Uso rápido

```bash
cp .env.example .env
docker compose up -d --build
```

- Laravel: `http://localhost:8000`
- Vite: `http://localhost:5173`
- MariaDB: `localhost:3307`
