#!/data/data/com.termux/files/usr/bin/bash
set -euo pipefail

echo "=============================================="
echo "  Modded Ubuntu launcher"
echo "=============================================="

if ! command -v proot-distro >/dev/null 2>&1; then
    echo "[!] proot-distro is not installed."
    echo "    Run install.sh first."
    exit 1
fi

if ! proot-distro list | grep -qE '^ubuntu[[:space:]].*\(installed\)|^ubuntu[[:space:]].*installed'; then
    echo "[!] Ubuntu is not installed."
    echo "    Run install.sh first."
    exit 1
fi

echo "[*] Starting Ubuntu..."
echo "[*] Type 'exit' to leave Ubuntu."

if proot-distro login ubuntu -- command -v zsh >/dev/null 2>&1; then
    exec proot-distro login ubuntu -- zsh -l
else
    exec proot-distro login ubuntu -- bash -l
fi
