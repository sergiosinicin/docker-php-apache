FROM php:7.2-apache
LABEL maintainer="BVE Develop <bve.develop@gmail.com>"

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_USER_ID 33

RUN a2enmod rewrite

RUN set -xe \
    && apt-get update \
    && apt-get install -y libpng-dev libjpeg-dev libmcrypt-dev zip unzip nano \
    && docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr \
    && docker-php-ext-install gd mysqli zip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY docker-init.sh /bin/

RUN chmod +x /bin/docker-init.sh

EXPOSE 80

CMD ["docker-init.sh"]
