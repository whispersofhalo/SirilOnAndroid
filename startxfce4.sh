#!/data/data/com.termux/files/usr/bin/bash
pulseaudio --start --exit-idle-time=-1
export DISPLAY=:0
proot-distro login debian -- bash -c "dbus-launch startxfce4"
