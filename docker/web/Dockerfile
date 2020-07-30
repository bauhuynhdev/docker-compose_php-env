FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive

# Install common
RUN apt-get update -y && \
    apt-get install -f -y && \
    apt-get install -y \
    software-properties-common \
    openssl \
    zip \
    unzip \
    curl \
    git

# Install Nginx
RUN add-apt-repository ppa:nginx/stable -y && \
    apt-get update -y && \
    apt-get install -y nginx

# Install PHP
RUN add-apt-repository ppa:ondrej/php -y && \
    apt-get update -y && \
    apt-get install -y \
    php7.4-cli \
    php7.4-common \
    php7.4-fpm \
    php7.4-mysql \
    php7.4-mysqlnd \
    php7.4-gd \
    php7.4-pdo \
    php7.4-mbstring \
    php7.4-xmlrpc \
    php7.4-zip \
    php7.4-bcmath \
    php7.4-json \
    php7.4-xml

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer

# Install Nodejs
RUN curl -sL https://deb.nodesource.com/setup_lts.x | bash - && \
    apt-get install -y nodejs build-essential

#COPY default /etc/nginx/sites-available/default

#COPY php.ini /etc/php/7.4/cli/php.ini

WORKDIR /var/www/web

EXPOSE 80 443

CMD service php7.4-fpm start && \
    nginx -g "daemon off;"
