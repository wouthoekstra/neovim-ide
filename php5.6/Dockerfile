# Used ide base image should already be build
FROM ide-base:latest

USER root

# Install php
RUN apk add --no-cache \
        php5 \
        php5-ctype \
 && apk add --no-cache -t .build-deps \
        php5-json \
        php5-openssl \
        php5-phar \
	php5-curl

# Install composer
RUN curl -sS https://getcomposer.org/installer | php5 -- --install-dir=/usr/bin --filename=composer 

RUN ln /usr/bin/php5 /usr/bin/php

# Install php PHPCS
USER me
RUN composer global require \
        'squizlabs/php_codesniffer=3.3.0'

ENV PATH=$PATH:/home/me/.composer/vendor/bin/
