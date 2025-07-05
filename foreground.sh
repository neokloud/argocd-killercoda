#!/bin/bash

echo "⏳ Setting up Helm..."
helm repo add argo https://argoproj.github.io/argo-helm >/dev/null 2>&1
helm repo update >/dev/null 2>&1

helm template argo-cd argo/argo-cd \
  --version 8.0.17 \
  --namespace argocd \
  --set crds.install=false > assets/argo-template.yaml

echo "✅ Helm setup done. You can now apply the YAML to deploy Argo CD."
