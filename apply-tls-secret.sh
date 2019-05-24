#!/bin/sh

echo "Applying hello-tls secret"


cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: Secret
metadata:
  name: hello-tls
  namespace: default
data:
  tls.crt: $(cat build/config/tls/certs/hello-tls.crt | base64 | tr -d '\n')
  tls.key: $(cat build/config/tls/keys/hello-tls.key | base64 | tr -d '\n')
type: kubernetes.io/tls
EOF


