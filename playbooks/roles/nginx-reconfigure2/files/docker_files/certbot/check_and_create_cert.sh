#!/bin/sh
set -e
if certbot certificates | grep -q "No certificates found."; then
    echo "Сертификат не найден. Создаю новый..."
    certbot certonly --webroot --w /var/www/certbot/ -d $DOMAIN_URL -d $GIT_DOMAIN -d $DRONE_DOMAIN -m $DOMAIN_EMAIL --agree-tos --no-eff-email --non-interactive --config-dir /etc/letsencrypt --work-dir /var/lib/letsencrypt --logs-dir /var/log/letsencrypt
else
    echo "Сертификат уже существует."
    certbot renew -n
fi