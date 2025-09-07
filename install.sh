#!/bin/bash
# =============================================
# Hardware Toolkit Installer for Linux Mint
# Author: Andhika Pratama Putra
# =============================================

set -e

WORKDIR="/opt/gugik-tools"
echo "[*] Membuat workspace di $WORKDIR..."
sudo mkdir -p "$WORKDIR"
sudo chown $USER:$USER "$WORKDIR"

echo "[*] Update repository..."
sudo apt update -y

echo "[*] Menginstal tools monitoring & system info..."
sudo apt install -y lshw lshw-gtk lspci lsusb hwinfo dmidecode inxi htop atop glances iotop

echo "[*] Menginstal tools jaringan..."
sudo apt install -y ethtool mii-tool iproute2 net-tools bridge-utils ifupdown nmap traceroute iperf3 tcpdump wireshark

echo "[*] Menginstal tools storage / RAID..."
sudo apt install -y smartmontools hdparm nvme-cli mdadm sg3-utils xxd hexdump bvi bless

echo "[*] Menginstal tools development untuk low-level utilities..."
sudo apt install -y build-essential gcc clang make python3 python3-pip

echo "[*] Menginstal optional tools (sandbox / simulasi)..."
sudo apt install -y docker.io qemu-system python3-venv

echo "[*] Menambahkan direktori $WORKDIR ke PATH sementara..."
export PATH="$WORKDIR:$PATH"

echo "[*] Membuat folder untuk backup EEPROM dan binary..."
mkdir -p "$WORKDIR/backups"
mkdir -p "$WORKDIR/bin"

echo "[*] Menginstal python package untuk scripting hardware..."
pip3 install pyudev pyserial

echo "[*] Setup selesai!"
echo "[*] Workspace: $WORKDIR"
echo "[*] Semua tools siap digunakan."

echo ""
echo "Tips:"
echo " - Backup EEPROM NIC sebelum melakukan unlock."
echo " - Gunakan sudo terbatas untuk ethtool/flashrom."
echo " - Gunakan sandbox / VM untuk test binary risky."
echo " - Binary unlock NIC bisa diletakkan di $WORKDIR/bin"
