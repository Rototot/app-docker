FROM php:7.2-apache
ARG TIMEZONE
ARG XDEBUG_IDEKEY

RUN apt-get update && apt-get install -y --no-install-recommends apt-utils

RUN apt-get update && apt-get install -y \
    openssl \
    git \
#    libfreetype6-dev \
#    libcurl3-dev \
#    libicu-dev \
#    libfreetype6-dev \
#    libjpeg-dev \
#    libjpeg62-turbo-dev \
#    libmagickwand-dev \
#    libpng-dev \
#    libxml2-dev \
#    zlib1g-dev \
#    imagemagick \
    libpq-dev \
#    unzip \
    libmcrypt-dev \
    unzip \
    --no-install-recommends


# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN composer --version

# Set timezone
RUN ln -snf /usr/share/zoneinfo/${TIMEZONE} /etc/localtime && echo ${TIMEZONE} > /etc/timezone
RUN printf '[PHP]\ndate.timezone = "%s"\n', ${TIMEZONE} > /usr/local/etc/php/conf.d/tzone.ini
RUN "date"

#RUN docker-php-ext-configure gd \
#        --with-freetype-dir=/usr/include/ \
#        --with-png-dir=/usr/include/ \
#        --with-jpeg-dir=/usr/include/ && \
#    docker-php-ext-configure bcmat


# Type docker-php-ext-install to see available extensions
RUN docker-php-ext-install \
    pdo \
    pdo_pgsql \
    bcmath \
    mcrypt \
    pdo_mysql
#    opcache \
#    zip \
#    soap \
#    exif \
#    gd \
#    iconv

#intl
#RUN apt-get install -y libicu-dev
#RUN docker-php-ext-install intl

#redis
RUN pecl install redis && docker-php-ext-enable redis


#fix for php docker pdo_pgsql
#RUN apt-get remove -y libpq-dev

# install xdebug
RUN pecl install xdebug
RUN docker-php-ext-enable xdebug
RUN echo "error_reporting = E_ALL" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
RUN echo "display_startup_errors = On" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
RUN echo "display_errors = On" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
RUN echo "xdebug.remote_enable=1" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
RUN echo "xdebug.remote_autostart=on" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
RUN echo "xdebug.remote_connect_back=1" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
RUN echo "xdebug.idekey=\"${XDEBUG_IDEKEY}\"" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
RUN echo "xdebug.remote_port=9001" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

WORKDIR /var/www/app
