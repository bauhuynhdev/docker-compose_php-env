FROM centos:7

SHELL ["/bin/bash", "-c"]

RUN yum update -y && \
    yum install -y \
    epel-release \
    yum-utils \
    python2 \
    python3 \
    zip \
    gcc-c++ \
    make \
    unzip \
    nano \
    openssl

RUN curl -fsSL https://rpm.nodesource.com/setup_14.x | bash -
RUN yum install -y nodejs

RUN echo $'\n\
[nginx-stable] \n\
name=nginx stable repo \n\
baseurl=http://nginx.org/packages/centos/$releasever/$basearch/ \n\
gpgcheck=1 \n\
enabled=1 \n\
gpgkey=https://nginx.org/keys/nginx_signing.key \n\
module_hotfixes=true' > /etc/yum.repos.d/nginx.repo

RUN yum install -y nginx

RUN yum install http://rpms.remirepo.net/enterprise/remi-release-7.rpm -y
RUN yum-config-manager --enable remi-php74 -y
RUN yum install php-fpm php-mysqlnd php-zip php-devel php-gd php-mcrypt php-mbstring php-curl php-xml php-pear php-bcmath php-json php-pgsql -y

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php -r "if (hash_file('sha384', 'composer-setup.php') === '756890a4488ce9024fc62c56153228907f1545c228516cbf63f885e036d37e9a59d27d63f46af1d4d07ee0f76181c7d3') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
RUN php composer-setup.php --install-dir=/usr/local/bin --filename=composer
RUN php -r "unlink('composer-setup.php');"

RUN mkdir /run/php-fpm

COPY start.sh /start.sh

WORKDIR /var/www

EXPOSE 80

ENTRYPOINT /start.sh
