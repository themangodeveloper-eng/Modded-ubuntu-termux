#!/data/data/com.termux/files/usr/bin/bash
set -euo pipefail

echo "[*] Installing extra CLI utilities..."

proot-distro login ubuntu -- bash -c '
set -e
export DEBIAN_FRONTEND=noninteractive
apt update
apt install -y \
    htop \
    tree \
    less \
    file \
    psmisc \
    net-tools \
    iputils-ping \
    ca-certificates \
    man-db \
    manpages
'

echo "[✓] Extra utilities installed."
