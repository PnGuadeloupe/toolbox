#!/bin/bash

#-----------------------------------
# THIS FILE IS INSTALLED BY ANSIBLE
# ALL CHANGES WILL BE LOST
#-----------------------------------

CURRENT_DIRECTORY=/home/karuadmin/replication_vers_BM/
SERVICE=png
FILENAME=dump.backup
BACKUPFOLDER=/tmp/

# Les chemins sur racoon-bm ne peuvent pas être changés par variable

cd ${CURRENT_DIRECTORY}

echo "Backup du ${SERVICE} into ${BACKUPFOLDER}${FILENAME}"
/usr/bin/pg_dump -d 'service=${SERVICE}' -F c -b -f "${BACKUPFOLDER}${FILENAME}"

echo "Copie du backup vers BM"
scp ${BACKUPFOLDER}${FILENAME} racoon-bm:/tmp/dump.backup

echo "SCP du script SQL drop DB"
scp ${CURRENT_DIRECTORY}recreate_db.sql racoon-bm:/tmp/

echo "Suppression de l'ancienne base et recréation"
ssh racoon-bm su -c 'psql -d postgres -f /tmp/recreate_db.sql' postgres

echo "Import des données"
ssh racoon-bm pg_restore -d 'service=png' --create -S postgres /tmp/dump.backup

echo "Suppression du backup local et remote"
rm ${BACKUPFOLDER}${FILENAME}
ssh racoon-bm rm /tmp/dump.backup
ssh racoon-bm rm /tmp/recreate_db.sql

