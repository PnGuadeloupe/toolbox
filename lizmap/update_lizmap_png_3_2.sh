#!/usr/bin/env bash

read -p "Voulez-vous vraiment mettre à jour Lizmap 3.2 sur l'instance PNG? o pour oui: " -n 1 -r
echo
if [[ $REPLY =~ ^[o]$ ]]
then
ssh karunati /bin/bash << EOF
cd /srv/lizmap_png/
sudo git fetch origin
sudo git checkout release_3_2
sudo git merge origin/release_3_2
sudo service nginx reload
printf "\n\n"
printf "Etat de NGINX: \n"
sudo service nginx status
printf "\n\n"
printf "MAJ de Lizmap:\n"
sudo git log -n 1 --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative
printf "\n"
EOF
fi
