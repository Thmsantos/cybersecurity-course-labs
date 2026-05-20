#!/bin/bash
# Thiago Messias Santos
# São Paulo, 20/05/2026
# IPv4 Addressing - Manual IP Configuration

echo "============================================="
echo "LINUX IP CONFIGURATION"
echo "============================================="
echo ""

IFACE="lo"
NEW_IP="10.99.99.1/24"

if ! command -v ip &> /dev/null
then
    echo "Error: 'ip' command not found."
    exit 1
fi

echo "[1] Adding IP address $NEW_IP to interface $IFACE..."
sudo ip addr add $NEW_IP dev $IFACE 2>/dev/null

if [ $? -ne 0 ]; then
    echo "Warning: Could not add IP (it may already exist)."
fi
echo ""

echo "[2] Current IPs on interface $IFACE:"
ip addr show dev $IFACE
echo ""

echo "[3] Testing connectivity (ping to itself)..."
ping -c 2 10.99.99.1 > /dev/null 2>&1

if [ $? -eq 0 ]; then
    echo "Ping successful ✅"
else
    echo "Ping failed ❌"
fi
echo ""

echo "[4] Cleaning up (removing IP)..."
sudo ip addr del $NEW_IP dev $IFACE 2>/dev/null

if [ $? -eq 0 ]; then
    echo "IP removed successfully."
else
    echo "Warning: Could not remove IP."
fi

echo ""
echo "============================================="
echo "Done!"
echo "============================================="