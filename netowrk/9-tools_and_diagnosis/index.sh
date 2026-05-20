#!/bin/bash
# Thiago Messias Santos
# São Paulo, 20/05/2026
# Network Troubleshooting - Full Check

echo "============================================="
echo "NETWORK CHECK-UP (LINUX)"
echo "============================================="
echo ""

for cmd in ip ping ss; do
    if ! command -v $cmd &> /dev/null; then
        echo "Error: $cmd is not installed."
        exit 1
    fi
done

echo "[1] Active Network Interfaces:"
ip -br a | grep UP
echo ""

echo "[2] Default Gateway:"
GATEWAY=$(ip route | awk '/default/ {print $3}')

if [ -z "$GATEWAY" ]; then
    echo "No gateway found"
else
    echo "Gateway: $GATEWAY"
fi
echo ""

echo "[3] Gateway Connectivity Test:"

if [ -n "$GATEWAY" ] && ping -c 1 -W 1 $GATEWAY &>/dev/null; then
    echo "Gateway reachable"
else
    echo "Cannot reach gateway"
fi
echo ""

echo "[4] Internet Connectivity Test (1.1.1.1):"

if ping -c 1 -W 2 1.1.1.1 &>/dev/null; then
    echo "Internet reachable"
else
    echo "No internet access"
fi
echo ""

echo "[5] DNS Resolution Test (google.com):"

if ping -c 1 -W 2 google.com &>/dev/null; then
    echo "DNS working"
else
    echo "DNS resolution failed"
fi
echo ""

echo "[6] Listening Services (TCP/UDP):"
ss -tuln
echo ""

echo "============================================="
echo "SUMMARY:"
echo "- Interface UP → Network active"
echo "- Gateway reachable → Local network OK"
echo "- Internet reachable → External connectivity OK"
echo "- DNS working → Name resolution OK"
echo "- Open ports → Running services"
echo "============================================="
echo "Done!"