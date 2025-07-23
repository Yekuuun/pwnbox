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
echo "       Cloning official CrackMapExec repo         "
echo "--------------------------------------------------"
echo -e "${RESET}"

if git clone https://github.com/byt3bl33d3r/CrackMapExec.git; then
    echo -e "${GREEN}✅ Repo cloned successfully.${RESET}"
else
    echo -e "${RED}❌ Failed to clone the repository.${RESET}"
    exit 1
fi

cd CrackMapExec || { echo -e "${RED}❌ Failed to enter CrackMapExec directory.${RESET}"; exit 1; }

echo -e "${CYAN}"
echo "--------------------------------------------------"
echo "             Building Docker image                "
echo "--------------------------------------------------"
echo -e "${RESET}"

if docker build . -t crackmapexec; then
    echo -e "${GREEN}✅ Docker image built successfully.${RESET}"
    docker run -it --rm crackmapexec --help
else
    echo -e "${RED}❌ Docker build failed.${RESET}"
    exit 1
fi
