#!/data/data/com.termux/files/usr/bin/bash
# Termux Debian + XFCE4 Auto Setup Script (English, no Siril)

set -e

echo "[*] Updating Termux packages..."
pkg update -y && pkg upgrade -y

echo "[*] Installing required Termux packages..."
pkg install -y x11-repo termux-x11-nightly tur-repo pulseaudio proot-distro wget git

echo "[*] Setting up storage access..."
termux-setup-storage

echo "[*] Installing Debian..."
proot-distro install debian

echo "[*] Installing XFCE4 desktop inside Debian..."
proot-distro login debian -- bash -c "
  apt update -y &&
  DEBIAN_FRONTEND=noninteractive apt install -y xfce4 xfce4-goodies x11-apps dbus-x11
"

echo "[*] Creating start script..."
cat > $PREFIX/bin/start-debian-xfce << 'EOF'
#!/data/data/com.termux/files/usr/bin/bash
# Debian XFCE Starter

pulseaudio --start --exit-idle-time=-1
export DISPLAY=:0
proot-distro login debian -- bash -c "dbus-launch startxfce4"
EOF

chmod +x $PREFIX/bin/start-debian-xfce

echo
echo "[✓] Installation finished!"
echo "Usage:"
echo "1. Open Termux-X11 app"
echo "2. In Termux, run:"
echo
echo "   start-debian-xfce"
