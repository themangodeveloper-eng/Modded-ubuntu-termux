#!/data/data/com.termux/files/usr/bin/bash
set -euo pipefail

echo "[*] Installing development tools inside Ubuntu..."

proot-distro login ubuntu -- bash -c '
set -e
export DEBIAN_FRONTEND=noninteractive
apt update
apt install -y \
    build-essential \
    python3 \
    python3-pip \
    python3-venv \
    nodejs \
    npm \
    git \
    nano \
    vim \
    curl \
    wget \
    unzip \
    zip
'

echo "[✓] Development tools installed."
