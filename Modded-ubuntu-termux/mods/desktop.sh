#!/data/data/com.termux/files/usr/bin/bash
set -euo pipefail

echo "[*] Installing XFCE + TigerVNC inside Ubuntu..."

proot-distro login ubuntu -- bash -c '
set -e
export DEBIAN_FRONTEND=noninteractive
apt update
apt install -y xfce4 xfce4-goodies tigervnc-standalone-server dbus-x11
mkdir -p /root/.vnc
cat > /root/.vnc/xstartup << "EOF"
#!/bin/sh
unset SESSION_MANAGER
unset DBUS_SESSION_BUS_ADDRESS
export XDG_CURRENT_DESKTOP=XFCE
export XDG_SESSION_DESKTOP=xfce
startxfce4 &
EOF
chmod +x /root/.vnc/xstartup
'

echo
echo "[✓] XFCE + TigerVNC installed."
echo "[*] To start VNC inside Ubuntu:"
echo "    vncserver :1 -localhost no"
echo
echo "[*] To stop it:"
echo "    vncserver -kill :1"
