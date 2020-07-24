Try Kubernetes

# tl;dr

Install either [Minikube](MINIKUBE.md) or 
[Docker Desktop](DOCKERDESKTOP.md).  Note that Minikube with VirtualBox 
installs k8s in a virtual machine on a separate IP address, so you can 
install both side-by-side to compare and contrast.

Show contexts and use appropriate one

    kubectl config get-contexts
    kubectl config use-context docker-for-desktop
    kubectl config use-context minikube

Create certificates and apply tls cert and key secret

    ./initialise-keys-and-certificates.sh
    ./apply-tls-secret.sh
        
Apply secret, deployment and service

    kubectl apply -f mock-secret.yaml
    kubectl apply -f hello-deployment.yaml
    kubectl apply -f hello-service.yaml
    kubectl apply -f hello-ingress.yaml

And view system

    kubectl get all 
    kubectl get ingress
    kubectl describe ingress hello-nginx    

# Clean up

    kubectl delete -f hello-ingress.yaml
    kubectl delete -f hello-service.yaml
    kubectl delete -f hello-deployment.yaml
    kubectl delete -f mock-secret.yaml    
    
# Creating a secret

Copy 

    echo -n 'mock-secret-value' | base64

into mock-secret.yml and 

    kubectl apply -f mock-secret.yaml
    
get with

    kubectl get secrets
    kubectl describe secrets/mock-secret
    kubectl get secret mock-secret -o yaml        

# Cluster analysis

    kubectl config get-contexts 
    kubectl describe nodes
    kubectl get all

Metrics server (TODO : get this working locally)

    helm install stable/metrics-server   
    kubectl top node

Open port onto a pod
    
    kubectl port-forward --namespace default $POD_NAME 8080:8080
        
# Thanks

https://www.katacoda.com