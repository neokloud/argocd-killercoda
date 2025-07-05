# 🎉 Scenario Complete!

You’ve successfully rendered and applied Argo CD to your Kubernetes cluster using Helm v8.0.17.

You can now port-forward the Argo CD UI:

```bash
kubectl port-forward svc/argo-cd-argocd-server -n argocd 8080:443
```

Access it at: `https://localhost:8080`
