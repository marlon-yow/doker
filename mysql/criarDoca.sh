#!/bin/bash
HOME_FOLDER=`pwd`

TZ=" TZ=America/Sao_Paulo"
LAN="wsnet"

IMAGE_NAME="mysql-mava"
CONTAINER_NAME="mysqlserver"

##de DOckerfile
CRIAR_IMAGEM=true

MOUNTS=""
MOUNTS="$MOUNTS -v $HOME_FOLDER/mysql-storage:/var/lib/mysql"
MOUNTS="$MOUNTS -v $HOME_FOLDER/my.cnf:/etc/my.cnf.d/mavalerio.cnf"

PORTS=""
PORTS="$PORTS -p 3306:3306"

#COMANDO="/usr/sbin/php-fpm8.1 -F"
#COMANDO="bash"
#COMANDO="'/usr/sbin/service php8.1-fpm start && while true; do echo hello world; sleep 100; done'"

#RESTART="unless-stopped"
#RESTART="on-failure"
#RESTART="no"

INTERATIVO=true

. ../_criaDockaFim.sh
