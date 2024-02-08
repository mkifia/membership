# Use the official PHP image with the specific version that you need
FROM php:8.3-fpm

LABEL author="Moustakime KIFIA"

# Set the COMPOSER_ALLOW_SUPERUSER environment variable
ENV COMPOSER_ALLOW_SUPERUSER=1

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip \
    libzip-dev \
    libpq-dev \
    libicu-dev \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    libxslt-dev \
    libmagickwand-dev \
    libmagickcore-dev \
    libmagickwand-dev \
    libmagickcore-dev \
    libmagickwand-dev \
    libmagickcore-dev

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Install PHP extensions
RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd zip intl xsl pdo_pgsql

COPY /infra/docker/php/php.ini /usr/local/etc/php/php.ini
COPY /infra/docker/php/php-fpm-pool.conf /usr/local/etc/php-fpm.d/www.conf

# Install Composer globally
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN curl -sS https://get.symfony.com/cli/installer | bash

RUN mv /root/.symfony5/bin/symfony /usr/local/bin/symfony

# Set working directory
WORKDIR /var/www/api

# Copy the application to the container (adjust the source path according to your project structure)
COPY /back /var/www/api

RUN chown -R www-data:www-data /var/www/api

# Install PHP dependencies
RUN composer install --no-interaction --prefer-dist --optimize-autoloader

# Expose port 9000 and start php-fpm server
EXPOSE 9000
CMD ["symfony", "server:start", "--no-tls", "--port=9000", "--dir=public"]

