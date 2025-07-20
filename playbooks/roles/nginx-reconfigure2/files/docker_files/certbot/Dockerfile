
#облегченный образ дебиан
FROM debian:stable-slim
LABEL authors="RONIS"

# Обновление и установка необходимых пакетов
RUN apt update && \
    apt install -y python3-certbot-nginx && \
    apt install -y cron


COPY check_and_create_cert.sh  ./

# Проверка наличия сертификата для домена
RUN chmod +x ./check_and_create_cert.sh && echo "0 0 1 * * certbot renew --quiet" | tee -a /etc/crontab > /dev/null


# Запуск скрипта в контейнере при старте "& cron -f" обеспечивает запуск процесса для поддержки контейнера 
CMD bash -c "./check_and_create_cert.sh & cron -f"

