
#облегченный образ дебиан
FROM registry-1.docker.io/library/ubuntu:latest
LABEL authors="RONIS"

# Обновление и установка необходимых пакетов с последующей очисткой
RUN sed -i 's|http://archive.ubuntu.com|http://mirror.yandex.ru/ubuntu|' /etc/apt/sources.list && \
    apt update && apt  install -y certbot python3-certbot-nginx cron && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

COPY check_and_create_cert.sh  ./

# Проверка наличия сертификата для домена
RUN chmod +x ./check_and_create_cert.sh && echo "0 0 1 * * certbot renew --quiet" | tee -a /etc/crontab > /dev/null


# Запуск скрипта в контейнере при старте "& cron -f" обеспечивает запуск процесса для поддержки контейнера 
CMD bash -c "./check_and_create_cert.sh & cron -f"

