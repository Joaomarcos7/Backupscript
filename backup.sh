#!/bin/bash

porta=22
data=`date +%d%m%Y-%H%M`
source ./golf #importa as variaveis do arquivo golf.txt 

# Loop sobre os caminhos do diretorio que serao enviados para a outra Maquina
for tarefas in "${objetos[@]}"
do 
echo -en "\nInício da Backup do Objeto $tarefas em "
/usr/bin/date
/usr/bin/rsync -rav --rsh="/usr/bin/sshpass -p $senha ssh -o StrictHostKeyChecking=no -l $usuario_local -p $porta" ~/$tarefas $usuario@$ip:/tmp --progress --relative --exclude-from="/etc/triade/backup/$1-excecoes"
echo -en "Final do Backup do Objeto em: "
/usr/bin/date
done


