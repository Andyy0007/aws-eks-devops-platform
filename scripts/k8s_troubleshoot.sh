#!/usr/bin/env bash
set -euo pipefail

NS="${1:-flask-app}"

echo "===== NODES ====="
kubectl get nodes -o wide

echo "===== PODS ====="
kubectl get pods -n "$NS" -o wide

echo "===== DEPLOYMENTS ====="
kubectl get deployments -n "$NS"

echo "===== SERVICES ====="
kubectl get svc -n "$NS"

echo "===== RECENT EVENTS ====="
kubectl get events -n "$NS" --sort-by=.lastTimestamp | tail -30

echo "===== POD DESCRIBE ====="
for pod in $(kubectl get pods -n "$NS" -o name); do
  echo "### $pod"
  kubectl describe "$pod" -n "$NS" | tail -40
done
