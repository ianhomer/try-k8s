Try Kubernetes with Docker Desktop

# tl;dr

Build image

    docker-compose build

# Kompose

Convert with kompose to get an idea of what the kubernetes configuration files
should look like :

    brew install kompose
    mkdir build
    cd build
    kompose convert -f ../docker-compose.yaml

View docker configuration :

    cat ~/.docker/config.json