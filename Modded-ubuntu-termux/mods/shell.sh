#!/data/data/com.termux/files/usr/bin/bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PREFIX="${PREFIX:-/data/data/com.termux/files/usr}"
UBUNTU_ROOT="$PREFIX/var/lib/proot-distro/installed-rootfs/ubuntu/root"

echo "[*] Installing Zsh + Starship inside Ubuntu..."

proot-distro login ubuntu -- bash -c '
set -e
export DEBIAN_FRONTEND=noninteractive
apt update
apt install -y zsh curl git
'

if proot-distro login ubuntu -- bash -c 'command -v starship >/dev/null 2>&1'; then
    echo "[*] Starship already installed."
else
    proot-distro login ubuntu -- bash -c '
    set -e
    curl -sS https://starship.rs/install.sh | sh -s -- -y
    '
fi

mkdir -p "$UBUNTU_ROOT/.config"
cp "$SCRIPT_DIR/configs/starship.toml" "$UBUNTU_ROOT/.config/starship.toml"

if [ -f "$SCRIPT_DIR/configs/.zshrc" ]; then
    cp "$SCRIPT_DIR/configs/.zshrc" "$UBUNTU_ROOT/.zshrc"
fi

echo "[✓] Zsh + Starship configured."
