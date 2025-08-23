# SirilOnAndroid

pkg update -y
pkg upgrade -y
pkg install x11-repo -y
pkg install termux-x11-nightly -y
pkg install tur-repo -y
pkg install pulseaudio -y 
pkg install proot-distro -y
pkg install wget -y
pkg install git -y
proot-distro install debian


proot-distro login debian
apt update -y 
apt install xfce4
