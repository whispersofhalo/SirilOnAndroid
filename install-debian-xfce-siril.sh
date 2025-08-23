#!/data/data/com.termux/files/usr/bin/bash
# Termux Debian + XFCE4 + Siril Auto Setup Script

set -e

echo "[*] Termux paketleri güncelleniyor..."
pkg update -y && pkg upgrade -y

echo "[*] Gerekli paketler yükleniyor..."
pkg install -y x11-repo termux-x11-nightly tur-repo pulseaudio proot-distro wget git

echo "[*] Storage erişimi ayarlanıyor..."
termux-setup-storage

echo "[*] Debian kuruluyor..."
proot-distro install debian

echo "[*] Debian içine XFCE4 ve Siril kuruluyor..."
proot-distro login debian -- bash -c "
  apt update -y &&
  DEBIAN_FRONTEND=noninteractive apt install -y xfce4 xfce4-goodies x11-apps dbus-x11 siril
"

echo "[*] Başlatma scripti ekleniyor..."
cat > $PREFIX/bin/start-debian-xfce << 'EOF'
#!/data/data/com.termux/files/usr/bin/bash
# Debian XFCE + Siril Starter

pulseaudio --start --exit-idle-time=-1
export DISPLAY=:0
proot-distro login debian -- bash -c "dbus-launch startxfce4"
EOF

chmod +x $PREFIX/bin/start-debian-xfce

echo
echo "[✓] Kurulum tamamlandı!"
echo "Kullanım:"
echo "1. Termux-X11 uygulamasını aç"
echo "2. Termux’ta şu komutu çalıştır:"
echo
echo "   start-debian-xfce"
