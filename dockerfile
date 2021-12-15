FROM php:7.2-apache

RUN apt-get update -y && apt-get install -y openssl zip unzip git wget gnupg libmcrypt-dev libpng-dev libzip-dev

RUN pecl install mcrypt-1.0.3
RUN docker-php-ext-install pdo pdo_mysql mysqli gd zip
RUN docker-php-ext-enable mcrypt

ENV HOME=/var/www/html

COPY . $HOME/

WORKDIR $HOME

CMD bash -c "php -S localhost:80"