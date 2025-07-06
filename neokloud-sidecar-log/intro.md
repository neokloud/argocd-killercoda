## 🧪 Task: Add Sidecar Container to Tail Logs

You have a Deployment named `neokloud-deployment` with a container writing logs to `/var/log/neokloud.log`.

👉 Add a **sidecar container**:
- Name: `sidecar`
- Image: `busybox:stable`
- Command: `tail -f /var/log/neokloud.log`
- Volume: `emptyDir`, mounted to `/var/log` in both containers

---

### ✅ Verification

```bash
kubectl get pod
kubectl logs -f <pod-name> -c sidecar
```