#!/bin/bash
set -e

echo "======================================="
echo "BluePill Module: PostgreSQL Database"
echo "======================================="

echo ""
echo "[1/5] Installing PostgreSQL..."
sudo apt update
sudo apt install -y postgresql postgresql-contrib

echo ""
echo "[2/5] Starting PostgreSQL service..."
sudo service postgresql start

echo ""
echo "[3/5] Creating database and user..."
sudo -u postgres psql -c "CREATE DATABASE makerx_dev;"
sudo -u postgres psql -c "CREATE USER makerx WITH ENCRYPTED PASSWORD 'makerx123';"
sudo -u postgres psql -c "GRANT ALL PRIVILEGES ON DATABASE makerx_dev TO makerx;"

echo ""
echo "[4/5] Configuring remote access..."
sudo bash -c 'echo "host all all 0.0.0.0/0 md5" >> /etc/postgresql/*/main/pg_hba.conf'
sudo bash -c "echo \"listen_addresses = '*'\" >> /etc/postgresql/*/main/postgresql.conf"
sudo service postgresql restart

echo ""
echo "[5/5] Verifying installation..."
if sudo -u postgres psql -lqt | cut -d \| -f 1 | grep -qw makerx_dev; then
  echo "✓ PostgreSQL installed successfully!"
  echo "✓ Database: makerx_dev"
  echo "✓ User: makerx"
  echo "✓ Service running on port 5432"
else
  echo "✗ Installation verification failed"
  exit 1
fi

echo ""
echo "======================================="
echo "Connection String:"
echo "postgresql://makerx:makerx123@localhost:5432/makerx_dev"
echo "======================================="
