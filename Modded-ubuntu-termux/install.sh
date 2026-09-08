#!/data/data/com.termux/files/usr/bin/bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PREFIX="${PREFIX:-/data/data/com.termux/files/usr}"

echo "=============================================="
echo "  Modded-ubuntu-termux Installer"
echo "=============================================="

command -v pkg >/dev/null 2>&1 || {
    echo "[!] This script must be run from Termux."
    exit 1
}

echo "[*] Updating Termux packages..."
pkg update -y
pkg upgrade -y

echo "[*] Installing dependencies..."
pkg install -y proot-distro git wget curl

echo "[*] Installing Ubuntu..."
if proot-distro list | grep -qE '^ubuntu[[:space:]].*\(installed\)|^ubuntu[[:space:]].*installed'; then
    echo "[!] Ubuntu is already installed, skipping base install."
else
    proot-distro install ubuntu
fi

echo "[*] Updating Ubuntu base system..."
proot-distro login ubuntu -- bash -c 'apt update && DEBIAN_FRONTEND=noninteractive apt upgrade -y'

UBUNTU_ROOT="$PREFIX/var/lib/proot-distro/installed-rootfs/ubuntu/root"
mkdir -p "$UBUNTU_ROOT"

echo "[*] Copying configuration files..."
for cfg in .bashrc .zshrc .vimrc; do
    if [ -f "$SCRIPT_DIR/configs/$cfg" ]; then
        cp "$SCRIPT_DIR/configs/$cfg" "$UBUNTU_ROOT/$cfg"
    fi
done

echo "[*] Select mods to install:"
echo "  1) Dev tools"
echo "  2) Shell (Zsh + Starship)"
echo "  3) Desktop (XFCE + VNC)"
echo "  4) Extras"
echo "  5) All"
echo "  0) None"
read -r -p "Enter choices separated by space (e.g. 1 2 4): " -a choices

for choice in "${choices[@]}"; do
    case "$choice" in
        1) bash "$SCRIPT_DIR/mods/devtools.sh" ;;
        2) bash "$SCRIPT_DIR/mods/shell.sh" ;;
        3) bash "$SCRIPT_DIR/mods/desktop.sh" ;;
        4) bash "$SCRIPT_DIR/mods/extras.sh" ;;
        5)
            bash "$SCRIPT_DIR/mods/devtools.sh"
            bash "$SCRIPT_DIR/mods/shell.sh"
            bash "$SCRIPT_DIR/mods/desktop.sh"
            bash "$SCRIPT_DIR/mods/extras.sh"
            ;;
        0) echo "[*] Skipping mods." ;;
        *) echo "[!] Unknown option: $choice" ;;
    esac
done

chmod +x "$SCRIPT_DIR/start-ubuntu.sh" "$SCRIPT_DIR/mods/"*.sh

echo
echo "[✓] Installation complete!"
echo "    Run:"
echo "    $SCRIPT_DIR/start-ubuntu.sh"
