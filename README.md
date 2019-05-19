Try Kubernetes

# tl;dr

Install

    brew install kubectl
    brew cask install docker minikube virtualbox
    minikube start

Building image

    eval (minikube docker-env) 
    docker build -t purplepip/hello:v1.11 hello

Apply secret, deployment and service

    kubectl apply -f mock-secret.yaml
    kubectl apply -f hello-deployment.yaml
    kubectl apply -f hello-service.yaml

Open service 

    minikube service hello-nginx

Or view with command line

    curl (minikube service hello-nginx --url)  

And view system

    kubectl get pods
    kubectl get deployment
    kubectl get service

# Minikube

Get the IP address minikube is running on

    minikube ip

# Clean up

    kubectl delete -f hello-nginx-deployment.yaml
    kubectl delete -f hello-nginx-service.yaml
    
# Creating a secret

Copy 

    echo -n 'mock-secret-value' | base64

into mock-secret.yml and 

    kubectl apply -f mock-secret.yaml
    
get with

    kubectl get secrets
    kubectl describe secrets/mock-secret
    kubectl get secret mock-secret -o yaml

# Thanks

https://gist.github.com/kevin-smets/b91a34cea662d0c523968472a81788f7