# Used ide base image should already be build
FROM ide-base:latest

USER root

# Install php
RUN set -x \
 && apk add --no-cache \
        php7 \
        php7-ctype \
        php7-simplexml \
        php7-tokenizer \
        php7-xmlwriter \
 && apk add --no-cache -t .build-deps \
        php7-json \
        php7-openssl \
        php7-phar

# Install composer
RUN curl -Lo /usr/local/bin/composer https://getcomposer.org/composer.phar \
 && chmod +sx /usr/local/bin/composer

RUN curl -sL http://static.phpmd.org/php/latest/phpmd.phar -o /usr/bin/phpmd \
    && chmod +x /usr/bin/phpmd

# Install php PHPCS
USER me
RUN composer global require \
        'squizlabs/php_codesniffer=3.3.0'

ENV PATH=$PATH:/home/me/.composer/vendor/bin/
