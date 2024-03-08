HOME_FOLDER=`pwd`

TZ="TZ=America/Sao_Paulo"
LAN="wsnet"

IMAGE_NAME="ngix-tampered2"
CONTAINER_NAME="nginx"

##de DOckerfile
CRIAR_IMAGEM=true

MOUNTS=""
MOUNTS="$MOUNTS -v $HOME_FOLDER/logs:/var/log/nginx"
MOUNTS="$MOUNTS -v $HOME_FOLDER/../certificados:/certificados"
MOUNTS="$MOUNTS -v $HOME_FOLDER/sites-enabled:/etc/nginx/sites-enabled"
MOUNTS="$MOUNTS -v $HOME_FOLDER/custom:/etc/nginx/custom"
MOUNTS="$MOUNTS -v /home/marlon/Projetos:/var/www/"
#MOUNTS="$MOUNTS -v $HOME_FOLDER/index.html:/var/www/index.html"

PORTS=""
#PORTS="$PORTS -p 443:443"
PORTS="$PORTS -p 444:444"

#COMANDO="nginx -g 'daemon off;'"

#COMANDO="bash"

INTERATIVO=false


. ../_criaDockaFim.sh
