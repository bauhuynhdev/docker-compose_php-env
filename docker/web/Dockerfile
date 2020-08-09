FROM centos:8

MAINTAINER Bau Huynh <bauhuynhdev@gmail.com>

ENV DEBIAN_FRONTEND=noninteractive

# Install common
RUN yum update -y && \
    yum install -y \
    epel-release \
    yum-utils \
    openssl \
    zip \
    unzip \
    curl \
    git && \
    dnf install -y \
    dnf-utils

# Install Nginx
COPY repo/nginx.repo /etc/yum.repos.d/
RUN yum install -y nginx
COPY default.conf /etc/nginx/conf.d/

# Install PHP
RUN dnf install -y http://rpms.remirepo.net/enterprise/remi-release-8.rpm && \
    dnf module reset php -y && \
    dnf module enable php:remi-7.4 -y && \
    dnf install -y \
    php \
    php-cli \
    php-common \
    php-fpm \
    php-mysql \
    php-mysqlnd \
    php-gd \
    php-pdo \
    php-mbstring \
    php-xmlrpc \
    php-zip \
    php-bcmath \
    php-json \
    php-xml
COPY www.conf /etc/php-fpm.d
RUN mkdir /run/php-fpm

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer

# Install Nodejs
RUN curl -sL https://rpm.nodesource.com/setup_lts.x | bash - && \
    yum install -y gcc-c++ make nodejs

WORKDIR /var/www/web

EXPOSE 80 443

CMD php-fpm -D && \
    nginx -g "daemon off;"
