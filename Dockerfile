FROM php:8.2-fpm
LABEL authors="Murad"

ENTRYPOINT ["top", "-b"]
RUN apt-get update && apt-get install -y \
    nginx \
    && docker-php-ext-install pdo pdo_mysql

RUN docker-php-ext-install pdo pdo_mysql mbstring exif pcntl bcmath

# Копируем конфиги
COPY nginx.conf /etc/nginx/nginx.conf

# Запуск Nginx и PHP-FPM
CMD service nginx start && php-fpm