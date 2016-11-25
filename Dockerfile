FROM richarvey/nginx-php-fpm:php7

RUN apk add --update --no-cache g++ gcc autoconf make libc-dev pkgconf re2c imagemagick-dev php7-dev libtool php7-mbstring
RUN apk del php5-soap php5

RUN ln -s /usr/bin/php7 /usr/bin/php
RUN ln -s /usr/bin/phpize7 /usr/bin/phpize
RUN ln -s /usr/bin/php-config7 /usr/bin/php-config

RUN sed -i 's/\-n//g' /usr/bin/pecl

RUN pecl install imagick
RUN echo "extension=imagick.so" > /etc/php7/conf.d/00_imagick.ini
