#!/data/data/com.termux/files/usr/bin/bash
# Start Debian XFCE4 (root, X11) in Termux

# Start PulseAudio
pulseaudio --start --exit-idle-time=-1

# Set DISPLAY for X11
export DISPLAY=:0

# Enter Debian and launch XFCE4
proot-distro login debian -- bash -c "dbus-launch startxfce4"
