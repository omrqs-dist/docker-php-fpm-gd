FROM omrqs/php-fpm-core:latest

LABEL description="Inherit omrqs:php-fpm-core dependencies and php-gd additionals."

RUN apk add --virtual --update --no-cache $PHPIZE_DEPS \
    libpng \
    libpng-dev \
    && rm -rf /var/cache/apk/* /var/lib/apk/* or /etc/apk/cache/*

RUN docker-php-ext-install gd
RUN apk del libpng-dev
