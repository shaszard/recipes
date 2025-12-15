#!/bin/bash
# MakerX Template Setup Script
# Auto-generated from: ubuntu-ollama-builder
# Generated: 2025-12-14T23:28:56.137Z
#
# This script reproduces the configuration of the captured instance.
# Review and modify as needed before using in Template Builder.

set -e

echo "=================================="
echo "MakerX Template Setup"
echo "Instance: ubuntu-ollama-builder"
echo "=================================="

# ============================================================================
# SYSTEM CONFIGURATION
# ============================================================================

echo ""
echo "[1/5] Configuring system..."

# Set DNS (adjust if needed)
echo "nameserver 8.8.8.8" > /etc/resolv.conf
echo "nameserver 8.8.4.4" >> /etc/resolv.conf

# Update package sources
apt update

# ============================================================================
# PACKAGE INSTALLATION
# ============================================================================

echo ""
echo "[2/5] Installing packages..."

# Detected packages (10 total)
apt install -y \
  ca-certificates \\
  htop \\
  libdebconfclient0 \\
  libnl-3-200 \\
  libnl-genl-3-200 \\
  screen \\
  ubuntu-minimal \\
  ubuntu-standard \\
  ubuntu-wsl \\
  wget

# ============================================================================
# CUSTOM SOFTWARE
# ============================================================================

echo ""
echo "[3/5] Installing custom software..."

# Install Ollama
echo "Installing Ollama..."
curl -fsSL https://ollama.com/install.sh | sh

# Start Ollama service in background
echo "Starting Ollama service..."
nohup ollama serve > /tmp/ollama.log 2>&1 &
sleep 5

# Pull phi3 model (required for AI functionality)
echo "Pulling phi3 model (this will take a few minutes)..."
ollama pull phi3

echo "✓ Ollama installed and phi3 model ready"

# ============================================================================
# SERVICES
# ============================================================================

echo ""
echo "[4/5] Configuring services..."

# systemctl enable apparmor.service
# systemctl enable cloud-config.service
# systemctl enable cloud-final.service
# systemctl enable cloud-init-local.service
# systemctl enable cloud-init.service
# systemctl enable dmesg.service
# systemctl enable e2scrub_reap.service
# systemctl enable irqbalance.service
# systemctl enable keyboard-setup.service
# systemctl enable landscape-client.service
# systemctl enable networkd-dispatcher.service
# systemctl enable setvtrgb.service
# systemctl enable snapd.apparmor.service
# systemctl enable snapd.autoimport.service
# systemctl enable snapd.core-fixup.service
# systemctl enable snapd.recovery-chooser-trigger.service
# systemctl enable snapd.seeded.service
# systemctl enable snapd.service
# systemctl enable snapd.system-shutdown.service
# systemctl enable ua-reboot-cmds.service
# systemctl enable ubuntu-advantage.service
# systemctl enable ufw.service

# ============================================================================
# CONFIGURATION
# ============================================================================

echo ""
echo "[5/5] Applying configuration..."

# Modified: /etc/resolv.conf
# Modified: /etc/apt/sources.list
# Modified: /etc/environment

# TODO: Add configuration commands

# ============================================================================
# FINALIZATION
# ============================================================================

echo ""
echo "=================================="
echo "✓ Setup complete!"
echo "=================================="
echo ""
echo "Instance is ready for export as template."
