#!/bin/bash
# Create namespace
kubectl create ns mariadb

# Create Deployment YAML
cat <<EOF > ~/mariadb-deployment.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: mariadb
  namespace: mariadb
spec:
  replicas: 1
  selector:
    matchLabels:
      app: local-maria
  template:
    metadata:
      labels:
        app: local-maria
    spec:
      containers:
      - name: mariadb
        image: mariadb:latest
        env:
        - name: MYSQL_ROOT_PASSWORD
          value: "rootpassword"
        ports:
        - containerPort: 3306
        volumeMounts:
        - mountPath: /var/lib/mysql
          name: mariadb-storage
      volumes:
      - name: mariadb-storage
        persistentVolumeClaim:
          claimName: ""
EOF

# Create PV YAML
cat <<EOF > ~/pv.yaml
apiVersion: v1
kind: PersistentVolume
metadata:
  name: mariadb-pv
spec:
  capacity:
    storage: 250Mi
  accessModes:
    - ReadWriteOnce
  persistentVolumeReclaimPolicy: Retain
  storageClassName: manual
  hostPath:
    path: "/mnt/data/mariadb"
EOF
