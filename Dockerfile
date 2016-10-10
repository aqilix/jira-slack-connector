#
# Use this dockerfile to run ZF3, Apigility with OAuth2.
#
# Start the server using docker-compose:
#
#   docker-compose up -d
#
# You can install dependencies via the container:
#
#   docker-compose run php composer install
# 

FROM ubuntu:xenial
MAINTAINER Dolly Aswin <dolly.aswin@aqilix.com>

COPY docker/apache2/aqilix.vhost.conf /etc/apache2/sites-available/
COPY docker/apache2/apache2-foreground /usr/local/bin

RUN apt-get update \
    && apt-get install -y wget curl git apache2 libapache2-mod-php7.0 \
       php7.0 php7.0-intl php7.0-curl php7.0-json php7.0-mbstring \
       php7.0-mcrypt php-redis php7.0-xml \
    && mv /var/www/html /var/www/public \
    && curl -sS https://getcomposer.org/installer \
     | php -- --install-dir=/usr/local/bin --filename=composer
RUN a2dissite 000-default \
    && a2enmod rewrite \
    && a2ensite aqilix.vhost

WORKDIR /var/www
EXPOSE 80
CMD ["apache2-foreground"]
