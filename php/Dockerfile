FROM php:8.1-fpm

RUN apt-get update && apt-get install libzip-dev zip libpng-dev -y
RUN docker-php-ext-install pdo pdo_mysql gd zip
RUN chown -R www-data:www-data /var/www/storage
COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer