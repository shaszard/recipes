#!/bin/bash
set -e

echo "==================================="
echo "BluePill Module: Redis Cache"
echo "==================================="

echo ""
echo "[1/4] Installing Redis..."
sudo apt update
sudo apt install -y redis-server

echo ""
echo "[2/4] Configuring Redis..."
sudo sed -i 's/bind 127.0.0.1 ::1/bind 0.0.0.0/g' /etc/redis/redis.conf
sudo sed -i 's/protected-mode yes/protected-mode no/g' /etc/redis/redis.conf

echo ""
echo "[3/4] Starting Redis service..."
sudo service redis-server start

echo ""
echo "[4/4] Verifying installation..."
if redis-cli ping | grep -q "PONG"; then
  echo "✓ Redis installed successfully!"
  echo "✓ Service running on port 6379"
else
  echo "✗ Installation verification failed"
  exit 1
fi

echo ""
echo "==================================="
echo "Redis ready for caching!"
echo "==================================="
