Depuis le site `https://sites.google.com/a/chromium.org/chromedriver/downloads`:

Télécharger `wget https://chromedriver.storage.googleapis.com/2.40/chromedriver_linux64.zip`

Dézipper le paquet dans le répertoire `lib`.

Appeler le script en utilisant des variables d'environnements:
* VIRTUALIA_NOM
* VIRTUALIA_PRENOM
* VIRTUALIA_PASSWORD

 ```bash
VIRTUALIA_NOM=TON_NOM VIRTUALIA_PRENOM=ton_prenom VIRTUALIA_PASSWORD=mot_de_passe /home/trimaille/dev/toolbox/venv/bin/python3.6 /home/trimaille/dev/toolbox/virtualia/badge.py

```
