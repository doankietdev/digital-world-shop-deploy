#!/bin/bash

export $(grep -v '^#' .env | xargs)

cleanup() {
  echo "Cleaning up..."
  
  docker rm -f temp-proxy > /dev/null 2>&1

  echo "Cleaned up"
}

trap cleanup EXIT

if [ "$(id -u)" -ne 0 ]; then
    echo "This script needs to be run with root privileges."
    exit 1
fi

echo "Starting temp-proxy..."
docker run -d \
  --name temp-proxy \
  -p 80:80 \
  -v $(pwd)/temp-proxy/nginx.conf:/etc/nginx/nginx.conf \
  -v $(pwd)/certbot/www:/var/www/certbot \
  nginx:latest

if [ $? -ne 0 ]; then
    echo "Failed to start temp-proxy."
    exit 1
fi

echo "Running certbot to generate SSL certificate..."
docker run -it --rm \
  --name certbot \
  -v $(pwd)/certbot/conf:/etc/letsencrypt \
  -v $(pwd)/certbot/www:/var/www/certbot \
  certbot/certbot certonly --staging --webroot -w /var/www/certbot --force-renewal --email $EMAIL -d $DOMAIN --agree-tos

if [ $? -ne 0 ]; then
    echo "Error running certbot."
    exit 1
fi

echo "Process completed. SSL certificate generated, temp-proxy removed."
