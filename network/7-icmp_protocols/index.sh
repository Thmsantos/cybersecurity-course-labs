#!/bin/bash
# Thiago Messias Santos
# São Paulo, 20/05/2026
# ICMP Diagnostics - Advanced Ping Tests

TARGET="1.1.1.1"

echo "============================================="
echo "ADVANCED PING TESTS (ICMP)"
echo "============================================="
echo "Target: $TARGET"
echo ""

if ! command -v ping &> /dev/null
then
    echo "Error: ping command not found."
    exit 1
fi

echo "[1] Basic Connectivity Test (3 packets):"
ping -c 3 $TARGET
echo ""

echo "[2] MTU / Large Packet Test (1500 bytes):"
echo "Testing for fragmentation issues..."

ping -s 1500 -c 2 $TARGET > /dev/null 2>&1

if [ $? -eq 0 ]; then
    echo "Large packets transmitted successfully"
else
    echo "Possible MTU/fragmentation issue"
fi
echo ""

echo "[3] Flood Test (Stress Test)"

if [ "$EUID" -ne 0 ]; then
    echo "Skipping flood test (requires root privileges)"
else
    echo "Sending 100 packets rapidly..."
    ping -f -c 100 $TARGET
    echo ""
    echo "Check '% packet loss' above for network performance."
fi

echo ""
echo "============================================="
echo "SUMMARY:"
echo "- Low latency → Good network response"
echo "- Packet loss → Possible congestion or instability"
echo "- MTU failures → Fragmentation problems"
echo "============================================="
echo "Done!"