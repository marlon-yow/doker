HOME_FOLDER=`pwd`

TZ=" TZ=America/Sao_Paulo"
LAN="wsnet"

IMAGE_NAME="php-fpm-template"
CONTAINER_NAME="phpserver"

##de DOckerfile
CRIAR_IMAGEM=true

MOUNT1="-v $HOME_FOLDER/mava_custom.conf:/etc/php/8.1/fpm/pool.d/zzz-mava_custom.conf"
MOUNT2="-v /home/marlon/Projetos:/var/www/"
MOUNT3="-v $HOME_FOLDER/logs:/var/log/php-fpm/"
MOUNTS="$MOUNT1 $MOUNT2 $MOUNT3"

#PORT1="-p 9001:9000"
#PORTS="$PORT1"

COMANDO="/usr/sbin/php-fpm8.1 -F"
#COMANDO="bash"
#COMANDO="'/usr/sbin/service php8.1-fpm start && while true; do echo hello world; sleep 100; done'"

INTERATIVO=false

. ../_criaDockaFim.sh
