# Use the official PHP image with the specific version that you need
FROM php:8.3-fpm
ARG TIMEZONE

LABEL author="Moustakime KIFIA"

# Set the COMPOSER_ALLOW_SUPERUSER environment variable
ENV COMPOSER_ALLOW_SUPERUSER=1

# copy the custom configuration files
COPY /infra/docker/php/php.ini /usr/local/etc/php/php.ini
COPY /infra/docker/php/php-fpm-pool.conf /usr/local/etc/php-fpm.d/www.conf

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
RUN docker-php-ext-install pdo mbstring exif pcntl bcmath gd zip intl xsl pdo_pgsql

# Set timezone
RUN ln -snf /usr/share/zoneinfo/${TIMEZONE} /etc/localtime && echo ${TIMEZONE} > /etc/timezone \
    && printf '[PHP]\ndate.timezone = "%s"\n', ${TIMEZONE} > /usr/local/etc/php/conf.d/tzone.ini \
    && "date"


# Install Composer globally
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN curl -sS https://get.symfony.com/cli/installer | bash

RUN mv /root/.symfony5/bin/symfony /usr/local/bin/symfony

# Copy the application to the container (adjust the source path according to your project structure)
COPY /back /srv/api

# Set working directory
WORKDIR /srv/api

RUN chmod -R 755 /srv/api/public/bundles
RUN chown -R www-data:www-data /srv/api

# Install PHP dependencies
RUN composer install --no-interaction --prefer-dist --optimize-autoloader

# Expose port 9000 and start php-fpm server
#EXPOSE 9000
#CMD ["symfony", "server:start", "--no-tls", "--port=9000", "--dir=public"]
#CMD ["php-fpm", "--nodaemonize", "--force-stderr", "--allow-to-run-as-root"]

