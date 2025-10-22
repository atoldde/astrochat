ARG PHP_VERSION=7.4
ARG COMPOSER_VERSION=1.9

# Composer
FROM composer:${COMPOSER_VERSION} AS composer

FROM php:${PHP_VERSION}-fpm-alpine

RUN apk update --no-cache \
    && apk add --no-cache --virtual build-deps \
        postgresql-dev \
    && apk add --no-cache \
        acl \
        bash \
        curl \
        run-parts

RUN docker-php-ext-install opcache pdo pdo_pgsql

# Install composer
COPY --from=composer /usr/bin/composer /usr/local/bin/composer

ADD php.ini /etc/php/conf.d/
ADD php.ini /etc/php/cli/conf.d/

# Install Symfony-cli
RUN curl -sS https://get.symfony.com/cli/installer | bash \
    && mv /root/.symfony5/bin/symfony /usr/local/bin/symfony \
    && mkdir /var/www/.symfony5 \
    && chmod -R 777 /var/www/.symfony5

# Add Entrypoints
COPY entrypoint.sh /usr/local/sbin/
RUN mkdir /entrypoint.d
COPY entrypoint.d/*.sh /entrypoint.d/
RUN chmod +x /usr/local/sbin/entrypoint.sh /entrypoint.d/*.sh

EXPOSE 9000
WORKDIR /var/www/mercure-chat

ENTRYPOINT ["/usr/local/sbin/entrypoint.sh"]
#CMD ["php-fpm", "-F"]
