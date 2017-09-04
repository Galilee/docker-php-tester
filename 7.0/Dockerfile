FROM php:7.0-cli
LABEL maintainer "Stéphane BARON <sbaron@galilee.fr>"

RUN apt-get update --yes \
	&& apt-get install --no-install-recommends --yes --quiet \
		openssh-client \
		git \
		zip \
		unzip \
		libpq-dev \
		zlib1g-dev \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install PHP modules (don't activate)
RUN pecl install xdebug \
	&& docker-php-ext-install -j$(nproc) pdo_mysql pdo_pgsql \
	&& rm -v /usr/local/etc/php/conf.d/docker-php-ext-pdo_*

# Install composer
RUN curl -s --location --output /usr/local/bin/composer https://getcomposer.org/composer.phar \
	&& chmod +x /usr/local/bin/composer

# Ssh config
RUN mkdir -p /root/.ssh
COPY resources/ssh_config /root/.ssh/config

COPY resources/entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]