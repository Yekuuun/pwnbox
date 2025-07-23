FROM golang:1.21-alpine3.19

# Installe les dépendances nécessaires et met à jour les paquets
RUN apk update && apk upgrade && apk add --no-cache git

# Crée un dossier pour ffuf
WORKDIR /app

# Clone le dépôt
RUN git clone https://github.com/ffuf/ffuf /app \
    && go build -o /usr/local/bin/ffuf

# Définit le point d'entrée
ENTRYPOINT ["ffuf"]
