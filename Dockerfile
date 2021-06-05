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
    nano

RUN curl -fsSL https://rpm.nodesource.com/setup_14.x | bash -
RUN yum install -y nodejs
RUN npm install yarn -g

WORKDIR /var/www

CMD ["tail", "-f", "/dev/null"]
