#!/bin/bash

set -e

# Charger le fichier .env
if [ -f .env ]; then
    source .env
else
    echo "❌ Fichier .env introuvable."
    exit 1
fi

cd "$DEST_DIR"

# Définition des couleurs
GREEN='\e[32m'
RED='\e[31m'
YELLOW='\e[33m'
CYAN='\e[36m'
RESET='\e[0m'

echo -e "${CYAN}"
echo "--------------------------------------------------"
echo "      Pulling official Gobuster Docker image      "
echo "--------------------------------------------------"
echo -e "${RESET}"

# Pull de l'image officielle
if docker pull ghcr.io/oj/gobuster:latest; then
    echo -e "${GREEN}✅ Gobuster image pulled successfully.${RESET}"
else
    echo -e "${RED}❌ Failed to pull Gobuster image.${RESET}"
    exit 1
fi

# Exemple d'exécution de Gobuster avec Docker
echo -e "${CYAN}Running Gobuster help output...${RESET}"

docker run --rm -it ghcr.io/oj/gobuster:latest --help
