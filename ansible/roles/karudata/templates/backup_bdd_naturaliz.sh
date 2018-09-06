#!/bin/bash

#-----------------------------------
# THIS FILE IS INSTALLED BY ANSIBLE
# ALL CHANGES WILL BE LOST
#-----------------------------------

# options
SERVICE=naturaliz
MYDATE=$(date +%Y-%m-%d_%H-%M-%S)
MYBACKUPFOLDER=/srv/backup/postgresql/
MYMAXFILES=5

# Dump PostGreSQL database
echo "Backuping service $SERVICE into $MYBACKUPFOLDER$MYDATE-bdd_$SERVICE.backup"
/usr/bin/pg_dump -d 'service=naturaliz' -F c -b -f "$MYBACKUPFOLDER$MYDATE-bdd-$SERVICE.backup"
cp "$MYBACKUPFOLDER$MYDATE-bdd-$SERVICE.backup" "${MYBACKUPFOLDER}latest-bdd-$SERVICE.backup"

# Also dump as plain format
/usr/bin/pg_dump -d 'service=naturaliz' -F p  -f "${MYBACKUPFOLDER}latest-bdd-$SERVICE.sql"

# Keep only the more recent files on the local backup dir
echo "Keep only the $MYMAXFILES more recent backups"
ls -t $MYBACKUPFOLDER*$SERVICE.backup | sed 1,$MYMAXFILES\d | while read file ; do rm $file; done

# End
echo "Backup done !"
