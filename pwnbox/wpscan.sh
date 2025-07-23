#!/bin/bash

set -e

if [ -f .env ]; then
    source .env
else
    echo "❌ Fichier .env introuvable."
    exit 1
fi

cd "$DEST_DIR"

# Colors
GREEN='\e[32m'
RED='\e[31m'
YELLOW='\e[33m'
CYAN='\e[36m'
RESET='\e[0m'

set -e  # Stop le script en cas d'erreur

echo -e "${CYAN}"
echo "--------------------------------------------------"
echo "      Building official wpscan docker image       "
echo "--------------------------------------------------"
echo -e "${RESET}"

if docker pull wpscanteam/wpscan; then
    echo -e "${GREEN}✅ Docker image pulled successfully.${RESET}"
    docker run -it --rm wpscanteam/wpscan --help
else
    echo -e "${RED}❌ Docker build failed.${RESET}"
    exit 1
fi