#!/bin/bash

RED="\e[31m"
BLUE="\e[34m"
GREEN="\e[32m"
CYAN="\e[36m"
ENDCOLOR="\e[0m"

function textRed() {
    printf "${RED}$1${ENDCOLOR}\n"
}
function textBlue() {
    printf "${BLUE}$1${ENDCOLOR}\n"
}
function textGreen() {
    printf "${GREEN}$1${ENDCOLOR}\n"
}
function textCyan() {
    printf "${CYAN}$1${ENDCOLOR}\n"
}

############################
# NORMALMENTE NAO PRECISA MEXER PRA BAIXO v1.1
############################

if [ "$CRIAR_IMAGEM" = true ] ; then
	DK1="docker build -t $IMAGE_NAME ."
	textCyan "--- CRIAR IMAGEM ---"
	echo $DK1
	textCyan "--------------------"
	if $DK1 ; then
		textGreen "Imagem criada!"
	else
		textRed "Falha ao criar imagem"
		exit 1
	fi
fi

## verificar se tem maquina rodando com mesmo nome
if [ ! -z "$CONTAINER_NAME" ]
then
	textBlue "Verificar maquina ativa"
	RESULT=`docker ps`
	if echo "$RESULT" | egrep $CONTAINER_NAME >/dev/null
	then
		textBlue "Ativa. Desligar..."
		if docker stop -t 1 $CONTAINER_NAME ; then
			textGreen "Desligada."
		else
			textRed "Falha ao desligar"
			exit 1
		fi
	else
		echo "Inativa"
	fi
	textBlue "Verificar maquina existente"
	RESULT=`docker ps -a`
	if echo "$RESULT" | egrep $CONTAINER_NAME >/dev/null
	then
		textBlue "Existe. Apagar..."
		if docker rm $CONTAINER_NAME ; then
			textGreen "Removida"
		else
			textRed "Falha ao remover. (Talvez um doker container prune resolva.)"
			exit 1
		fi
	else
		echo "Nao existe"
	fi
fi
textCyan "--- LINHA ---"
DK2="docker run "
[ "$INTERATIVO" = true ] && DK2="$DK2 -it" || DK2="$DK2 -d"
[ -z "$TZ" ] && echo "TZ Empty" || DK2="$DK2 --env $TZ"
[ -z "$ENV" ] && : || DK2="$DK2 $ENV"
[ -z "$LAN" ] && echo "LAN Empty" || DK2="$DK2 --net $LAN"
[ -z "$CONTAINER_NAME" ] && echo "CONTAINER_NAME Empty" || DK2="$DK2 --name $CONTAINER_NAME"
[ -z "$PORTS" ] && echo "PORTS Empty" || DK2="$DK2 $PORTS"
[ -z "$MOUNTS" ] && echo "MOUNTS Empty" || DK2="$DK2 $MOUNTS"
[ -z "$RESTART" ] && echo "auto restart no" || DK2="$DK2 --restart $RESTART"
DK2="$DK2 $IMAGE_NAME"
[ -z "$COMANDO" ] && echo "COMANDO Empty" || DK2="$DK2 $COMANDO"

textCyan "--- EXECUTAR ---"
echo $DK2
textCyan "--------------------"
$DK2
