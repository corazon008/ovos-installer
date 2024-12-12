#!/bin/bash

# Vérifier si le script est exécuté avec les privilèges root
if [ "$EUID" -ne 0 ]; then
  echo "Veuillez exécuter ce script en tant que root."
  exit 1
fi

echo "=== Configuration du kit Google AIY V1 ==="
CONFIG_FILE="/boot/firmware/config.txt"

# Sauvegarde du fichier de configuration
echo "Sauvegarde du fichier de configuration actuel : $CONFIG_FILE"
cp "$CONFIG_FILE" "${CONFIG_FILE}.bak"

# Désactivation de l'audio HDMI
echo "Modification de $CONFIG_FILE pour désactiver l'audio HDMI."
sed -i 's/^dtparam=audio=on/#dtparam=audio=on/' "$CONFIG_FILE"

sed -i 's/^#dtparam=spi=on/dtparam=spi=on/' "$CONFIG_FILE"

# Ajouter l'overlay Google Voice Hat
if grep -q "^\[all\]" "$CONFIG_FILE"; then
  echo "Section [all] trouvée. Ajout de 'dtoverlay=googlevoicehat-soundcard' sous [all]."
  sed -i '/^\[all\]/a dtoverlay=googlevoicehat-soundcard' "$CONFIG_FILE"
else
  echo "Section [all] absente. Ajout de [all] et de 'dtoverlay=googlevoicehat-soundcard' à la fin."
  echo -e "\n[all]\ndtoverlay=googlevoicehat-soundcard" >> "$CONFIG_FILE"
fi