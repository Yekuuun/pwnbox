#!/bin/bash
# Official documentation : https://neko.m1k1o.net/docs/v3/installation

# Firefox base for myself => use this a persistence if you want to keep data & put in a volume in docker-compose.yml

# Colors
GREEN='\e[32m'
RED='\e[31m'
RESET='\e[0m'

set -e  # Stop le script en cas d'erreur

echo -e "${CYAN}"
echo "--------------------------------------------------"
echo "             Building dest folder                 "
echo "--------------------------------------------------"
echo -e "${RESET}"

if sudo mkdir /opt/neko; then
    echo -e "${GREEN}✅ Neko folder created successfully.${RESET}"
else
    echo -e "${RED}❌ Failed to create Neko folder.${RESET}"
    exit 1
fi