# 🚀 Argo CD Installation using Helm (v8.0.17)

This scenario will help you install **Argo CD** in a Kubernetes cluster using Helm **without CRDs**.

### Step 1: Add Helm Repo

```bash
helm repo add argo https://argoproj.github.io/argo-helm
helm repo update
```

### Step 2: Render the Argo CD Manifest

```bash
helm template argo-cd argo/argo-cd \
  --version 8.0.17 \
  --namespace argocd \
  --set crds.install=false > argo-template.yaml
```

### Step 3: Apply to Cluster

```bash
kubectl create namespace argocd
kubectl apply -f argo-template.yaml
```

> Note: CRDs must be installed separately if not already present.
