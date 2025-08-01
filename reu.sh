#!/bin/bash

# Generate wordpress deployment YAML
cat <<EOF > ~/wordpress.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: wordpress
spec:
  replicas: 3
  selector:
    matchLabels:
      app: wordpress
  template:
    metadata:
      labels:
        app: wordpress
    spec:
      initContainers:
      - name: init-myservice
        image: busybox
        command: ['sh', '-c', 'echo Initializing...']
      containers:
      - name: wordpress
        image: wordpress:latest
        ports:
        - containerPort: 80
        resources:
          requests:
            cpu: "300m"
            memory: "400Mi"
          limits:
            cpu: "400m"
            memory: "500Mi"
EOF

# Apply the deployment
kubectl apply -f ~/wordpress.yaml
