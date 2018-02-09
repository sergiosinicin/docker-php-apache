FROM php:5.6-apache
MAINTAINER bved <bve.develop@gmail.com>

RUN a2enmod rewrite

RUN set -xe \
    && apt-get update \
    && apt-get install -y libpng-dev libjpeg-dev libmcrypt-dev zip unzip nano \
    && docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr \
    && docker-php-ext-install mcrypt gd mysqli zip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN set -xe \
    && echo "#!/bin/bash" >> /bin/start.sh \
    && echo "set -e" >> /bin/start.sh \
    && echo "chown -R www-data:www-data /var/www/html" >> /bin/start.sh \
    && echo "apache2-foreground" >> /bin/start.sh \
    && chmod +x /bin/start.sh

EXPOSE 80

CMD ["start.sh"]