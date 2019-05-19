Try Kubernetes with Docker Desktop

# tl;dr

Build image

    docker build -t purplepip/hello:v1.12 hello

Apply 

    kubectl apply -f mock-secret.yaml
    kubectl apply -f hello-deployment.yaml
    kubectl apply -f hello-service.yaml

Get port

    kubectl describe service/hello-nginx
    kubectl get all 

And access, e.g. http://localhost:32103/

# Reset

Docker -> preferences -> reset -> Reset Kubernetes Cluster

# Docker compose

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