Try Kubernetes

# tl;dr

Install either [Minikube](MINIKUBE.md) or 
[Docker Desktop](DOCKERDESKTOP.md).  Note that Minikube with VirtualBox 
installs k8s in a virtual machine on a separate IP address, so you can 
install both side-by-side to compare and contrast.

Apply secret, deployment and service

    kubectl apply -f mock-secret.yaml
    kubectl apply -f hello-deployment.yaml
    kubectl apply -f hello-service.yaml

And view system

    kubectl get pods
    kubectl get deployment
    kubectl get service

# Clean up

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
    