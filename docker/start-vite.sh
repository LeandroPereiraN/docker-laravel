#!/bin/sh
set -e

while [ ! -f package.json ]; do
  echo "Esperando que Laravel sea inicializado..."
  sleep 2
done

npm install
npm run dev
