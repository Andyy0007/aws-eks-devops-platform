#!/usr/bin/env bash
set -euo pipefail

echo "===== HOST ====="
hostname
uptime

echo "===== CPU / MEMORY ====="
free -h
top -bn1 | head -15

echo "===== DISK ====="
df -h

echo "===== FAILED SERVICES ====="
systemctl --failed --no-pager || true

echo "===== LISTENING PORTS ====="
ss -lntp || true

echo "===== DOCKER ====="
docker ps --format 'table {{.Names}}\t{{.Status}}\t{{.Ports}}' 2>/dev/null || true
