#!/bin/bash

# Vérifier si le script est exécuté avec les privilèges root
if [ "$EUID" -ne 0 ]; then
  echo "Veuillez exécuter ce script en tant que root."
  exit 1
fi

echo "Installattion de git et curl"
apt update
apt upgrade -y
apt install git curl -y

# Chemin du fichier contenant le texte (banner.txt)
BANNER_FILE="banner.txt"

# Vérifier si le fichier banner.txt existe
if [ ! -f "$BANNER_FILE" ]; then
  echo "Erreur : le fichier $BANNER_FILE n'existe pas."
  exit 1
fi

# Ajouter le contenu de banner.txt à la fin de /etc/motd
cat "$BANNER_FILE" >> /etc/motd

echo "Le contenu de $BANNER_FILE a été ajouté à /etc/motd."
exit 0