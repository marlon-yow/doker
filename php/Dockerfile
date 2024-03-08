FROM debian:bullseye-backports

RUN echo "deb http://deb.debian.org/debian/ unstable main" >> /etc/apt/sources.list

## Atualizar APT
RUN apt-get update;

## TOOLS
RUN apt-get -y --no-install-recommends install \
    lsb-release \
    apt-utils \
    ca-certificates \
    gnupg \
    libldap2-dev \
    libldb-dev \
    wget;

## PHP8
RUN echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main"\
    | tee /etc/apt/sources.list.d/sury-php.list

RUN wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg

RUN apt-get update; \
    apt-get -y --no-install-recommends install \
    php8.1-fpm;

RUN apt-get -y --no-install-recommends install \
    php8.1-bcmath \
    php8.1-xml \
    php8.1-simplexml \
    php8.1-mbstring \
    php8.1-common \
    php8.1-gd \
    php8.1-imagick \
    php8.1-mysqli;

RUN apt-get -y --no-install-recommends install \
    libpcre2-8-0 \
    php8.1-dev \
    php-xml;
    #php-pear \
    #autoconf automake libtool m4 \
    #g++ make \
    #unixodbc-dev \

RUN apt-get clean;

RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

RUN echo "date.timezone=America/Sao_Paulo" >> /etc/php/8.1/fpm/php.ini
RUN echo "max_execution_time = 400" >> /etc/php/8.1/fpm/php.ini
RUN echo "max_input_time = 300" >> /etc/php/8.1/fpm/php.ini
RUN echo "memory_limit = 256M" >> /etc/php/8.1/fpm/php.ini
RUN echo "error_reporting = E_ALL & ~E_DEPRECATED & ~E_STRICT & ~E_NOTICE" >> /etc/php/8.1/fpm/php.ini
RUN echo "html_errors = Off" >> /etc/php/8.1/fpm/php.ini
RUN echo "post_max_size = 50M" >> /etc/php/8.1/fpm/php.ini
RUN echo "upload_max_filesize = 50M" >> /etc/php/8.1/fpm/php.ini

RUN echo "[global]" > /etc/php/8.1/fpm/php-fpm.conf
RUN echo "pid = /run/php8.1-fpm.pid" >> /etc/php/8.1/fpm/php-fpm.conf
RUN echo "error_log = /var/log/php8.1-fpm.log" >> /etc/php/8.1/fpm/php-fpm.conf
RUN echo "include=/etc/php/8.1/fpm/pool.d/*.conf" >> /etc/php/8.1/fpm/php-fpm.conf
