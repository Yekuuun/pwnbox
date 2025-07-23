#!/bin/bash
# Safe cleanup script for project environment

set -e

# Load environment variables
if [ -f .env ]; then
    source .env
else
    echo "❌ Fichier .env introuvable."
    exit 1
fi

# Colors
GREEN='\e[32m'
RED='\e[31m'
YELLOW='\e[33m'
CYAN='\e[36m'
RESET='\e[0m'

echo -e "${CYAN}"
echo "--------------------------------------------------"
echo "            Cleaning work environment             "
echo "--------------------------------------------------"
echo -e "${RESET}"

# Ask confirmation before stopping all containers
read -p "⚠️  Stop all Docker containers? [y/N]: " stop_all
if [[ "$stop_all" =~ ^[Yy]$ ]]; then
    docker ps -q | xargs -r docker stop
    echo -e "${GREEN}✅ All containers stopped.${RESET}"
else
    echo -e "${YELLOW}⏩ Skipped stopping containers.${RESET}"
fi

# Ask confirmation before pruning all Docker resources
read -p "⚠️  Remove all unused Docker images, containers, volumes? [y/N]: " prune_all
if [[ "$prune_all" =~ ^[Yy]$ ]]; then
    docker system prune -a --volumes -f
    echo -e "${GREEN}✅ Docker system pruned.${RESET}"
else
    echo -e "${YELLOW}⏩ Skipped docker system prune.${RESET}"
fi

# Ask confirmation before deleting the DEST_DIR
read -p "⚠️  Delete directory '$DEST_DIR'? This is irreversible. [y/N]: " delete_dir
if [[ "$delete_dir" =~ ^[Yy]$ ]]; then
    sudo rm -rf "$DEST_DIR"
    echo -e "${GREEN}✅ Deleted directory: $DEST_DIR${RESET}"
else
    echo -e "${YELLOW}⏩ Skipped deleting $DEST_DIR.${RESET}"
fi
