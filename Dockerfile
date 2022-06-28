FROM devilbox/php-fpm-7.4:latest
RUN apt-get update && apt-get install -y --no-install-recommends \
        git \
        libicu-dev \
        g++ \
        libonig-dev \
        libxslt-dev \
        zlib1g-dev \
        libxml2-dev \
        libpng-dev \
        libzip-dev \
        vim curl debconf subversion git apt-transport-https apt-utils \
        build-essential locales acl mailutils wget nodejs zip unzip \
        gnupg gnupg1 gnupg2 zlib1g-dev \
        librabbitmq-dev \
        libssh-dev \
        sudo \
        ssh \
        && pecl install amqp \
        && docker-php-ext-enable amqp\
    && docker-php-ext-install \
        pdo_mysql \
        soap \
        zip \
        dom\
        xsl\
        opcache \
        gd \
        dom\
        mbstring \
        calendar \
        intl
RUN curl -o composer-setup.php https://getcomposer.org/installer
RUN php composer-setup.php --version=2.2.9
RUN mv composer.phar /usr/local/bin/composer
RUN wget --no-check-certificate https://phar.phpunit.de/phpunit-6.5.3.phar && \
    mv phpunit*.phar phpunit.phar && \
    chmod +x phpunit.phar && \
    mv phpunit.phar /usr/local/bin/phpunit
WORKDIR /app