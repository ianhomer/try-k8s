# Docker side of things

Build and deploy into Docker desktop

    docker-compose up -d --build

Convert with kompose to get an idea of what the kubernetes configuration files
should look like :

    brew install kompose
    mkdir build
    cd build
    kompose convert -f ../docker-compose.yaml

View docker configuration :

    cat ~/.docker/config.json