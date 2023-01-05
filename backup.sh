#!/usr/bin/env sh

# Diretorio de Backup

backup_path="/home/user/Documentos"

# Diretorio de Destino

destino="/mnt/backup"

#formato do arquivo

date_format=$(date "+%d-%m-%Y")
final_archive_name="backup-$date_format.tar.gz"
#arquivo de log

log_file="/var/log/daily-backup.log" 
#teste se o pen drive ta plugado 
if ! mountpoint -q -- $destino ; then
    printf "Device not mounted in $destino CHECK IT.\n"
    exit 1
fi

 
   ############ ínicio do backup 

tar -czSpf "$destino/$final_archive_name" "$backup_path"

