# Pre-requisites

Docker desktop and kubectl installed.  Fish shell.

# tl;dr

```
brew cask install google-cloud-sdk
gcloud components install kubectl
```

Log in and select project

```
gcloud init
```

Allow docker desktop to push images to your gcloud project

```
gcloud auth configure-docker
gcloud info
```

Change project, region etc if necessary

```
gcloud config set project try-10
gcloud config set compute/region us-west1
```

```
set -x HELLO_VERSION v1.13
set -x PROJECT_ID (gcloud config get-value project -q)
docker build -t gcr.io/$PROJECT_ID/hello-nginx:$HELLO_VERSION hello-nginx
docker push gcr.io/$PROJECT_ID/hello-nginx:$HELLO_VERSION
```

Visit **Container Registry** in your GCP project to see this image in the 
registry.

Create cluster

```
gcloud container clusters create hello-cluster \
  --machine-type=f1-micro \
  --num-nodes=1 \
  --max-nodes=2 \
  --region=us-west1 \
  --no-enable-autoupgrade
```

Check cluster created OK

    gcloud compute instances list

Check you're configured to use the right cluster

    kubectl config get-contexts

Deploy service - _edit the project in the image name in hello-deployment.yaml as
appropriate_

    kubectl apply -f mock-secret.yaml
    kubectl apply -f hello-deployment.yaml
    kubectl apply -f hello-service.yaml   
    
Visit **Kubernetes Engine** in GCP to see your deployment.

Visit service at external IP address from 

    kubectl get service 

# Clean up

    gcloud container clusters delete hello-cluster --region=us-west1

And, from the GCP console, delete any repository images you no longer need.

# Thanks

* https://cloud.google.com/kubernetes-engine/docs/tutorials/hello-app
* https://cloud.google.com/sdk/docs/quickstarts