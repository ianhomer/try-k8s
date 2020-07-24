Try Kubernetes with Minikube on VirtualBox

# tl;dr

Install

    brew install kubectl
    brew cask install docker minikube virtualbox
    minikube start --memory=4096

Build image

    eval (minikube docker-env) 
    docker build -t purplepip/hello:v1.11 hello

Apply secret, deployment and service

    kubectl apply -f mock-secret.yaml
    kubectl apply -f hello-deployment.yaml
    kubectl apply -f hello-service.yaml

Open service in browser

    minikube service hello-nginx

Or view with command line

    curl (minikube service hello-nginx --url)  

# Minikube

Get the IP address minikube is running on

    minikube ip

Troubleshooting 

    minikube version
    minikube addons enable heapster 
    minikube dashboard
        
# Clean up minikube

    minikube delete
    rm -Rf ~/.minikube/
    
# Thanks

https://gist.github.com/kevin-smets/b91a34cea662d0c523968472a81788f7