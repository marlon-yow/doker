FROM debian:bookworm-backports
RUN echo "deb http://deb.debian.org/debian/ unstable main" >> /etc/apt/sources.list

## Atualizar APT
RUN apt update;

## TOOLS
RUN apt-get -y --no-install-recommends install \
    lsb-release \
    apt-utils \
    ca-certificates \
    gnupg \
    libldap2-dev \
    libldb-dev \
    wget;

RUN apt -y --no-install-recommends install \
    nginx; 

RUN apt clean; \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

CMD nginx -g "daemon off;"
