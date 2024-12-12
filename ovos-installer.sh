#!/bin/bash

# Vérifier si le script est exécuté avec les privilèges root
if [ "$EUID" -ne 0 ]; then
  echo "Veuillez exécuter ce script en tant que root."
  exit 1
fi

# Fonction pour exécuter un script enfant
run_script() {
  local SCRIPT_PATH="$1"

  # Vérifier si le script existe
  if [ ! -f "$SCRIPT_PATH" ]; then
    echo "Erreur : le script $SCRIPT_PATH n'existe pas."
    return 1
  fi

  # Exécuter le script
  echo "Exécution du script : $SCRIPT_PATH"
  bash "$SCRIPT_PATH"

  # Vérifier si le script s'est exécuté avec succès
  if [ $? -ne 0 ]; then
    echo "Erreur : le script $SCRIPT_PATH a échoué."
    exit 1
  fi

  echo "Script $SCRIPT_PATH terminé avec succès."
}

# Liste des scripts à exécuter (ajoute tes scripts ici)
SCRIPTS=(
  "./banner.sh"
  "./increase_swap.sh"
  "./setup_google_aiy_v1.sh"
)

# Boucle pour exécuter tous les scripts dans l'ordre
for SCRIPT in "${SCRIPTS[@]}"; do
  run_script "$SCRIPT"
done

echo "Tous les scripts ont été exécutés avec succès."