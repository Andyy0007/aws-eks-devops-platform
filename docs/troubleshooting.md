# Troubleshooting Runbook

## Pod not starting

```bash
kubectl get pods -n flask-app
kubectl describe pod <pod> -n flask-app
kubectl logs <pod> -n flask-app --previous
kubectl get events -n flask-app --sort-by=.lastTimestamp
```

Check:
- image pull errors
- missing ConfigMap/Secret
- resource limits
- readiness/liveness failures

## Service not reachable

```bash
kubectl get svc -n flask-app
kubectl get endpoints -n flask-app
kubectl port-forward svc/flask-app-flask-app 5000:5000 -n flask-app
```

## EKS node issue

```bash
kubectl get nodes
kubectl describe node <node>
kubectl get pods -A -o wide
```

## Prometheus not scraping

```bash
kubectl get servicemonitor -A
kubectl get endpoints -n flask-app
kubectl describe servicemonitor flask-app-flask-app -n monitoring
```

## Linux host issue

```bash
./scripts/linux_health_check.sh
journalctl -u docker --since "30 minutes ago"
df -h
free -h
ss -lntp
```
