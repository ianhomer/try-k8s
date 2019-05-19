Try Kubernetes

# tl;dr

    brew install kubectl
    brew cask install docker minikube virtualbox
    minikube start

    eval (minikube docker-env) 
    docker build -t purplepip/hello:v1.1 hello

    kubectl apply -f hello-deployment.yaml
    kubectl apply -f hello-service.yaml

View service output at http://localhost/

And show system

    kubectl get pods
    kubectl get deployment
    kubectl get service

# Kubernetes

Deploy

    kubectl apply -f hello-deployment.yaml
    kubectl apply -f hello-service.yaml

# Clean up

    kubectl delete -f hello-nginx-deployment.yaml
    kubectl delete -f hello-nginx-service.yaml

# Deploying pod

Apply kubernetes pod

    kubectl apply -f hello-nginx-pod.yaml

Show pods

    kubectl get pods

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
    
# Creating a secret

Copy 

    echo -n 'mock-secret-value' | base64

into mock-secret.yml and 

    kubectl apply -f ./mock-secret.yaml
    
get with

    kubectl get secrets
    kubectl describe secrets/mock-secret
    kubectl get secret mock-secret -o yaml
