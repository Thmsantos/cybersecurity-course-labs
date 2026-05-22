#!/bin/bash
# Thiago Messias Santos
# São Paulo, 20/05/2026
# OSI Model - Advanced Packet Analysis

echo "============================================="
echo "OSI MODEL - FULL PACKET ANALYSIS"
echo "============================================="
echo ""

echo "[1] ICMP TEST (PING) - Layers 2, 3 and 4"
echo "Sending 1 ICMP packet to 8.8.8.8..."
echo ""

ping -c 1 8.8.8.8 > /dev/null 2>&1 &

echo "Capturing ICMP packets..."
sudo tcpdump -i any -c 2 -e -n -vvv icmp 2>/dev/null

echo ""
echo "Explanation:"
echo "Layer 2 (Data Link): MAC addresses"
echo "Layer 3 (Network): IP addresses"
echo "Layer 4 (Transport): ICMP protocol"
echo ""

echo "============================================="
echo "[2] HTTP TEST - Showing Application Layer (Layer 7)"
echo "Requesting example.com using curl..."
echo ""

curl http://example.com > /dev/null 2>&1 &

echo "Capturing HTTP packets..."
sudo tcpdump -i any -c 10 -A -n port 80 2>/dev/null

echo ""
echo "Explanation:"
echo "Layer 2: MAC addresses"
echo "Layer 3: IP addresses"
echo "Layer 4: TCP protocol"
echo "Layer 7: HTTP request (GET, headers, etc)"
echo ""

echo "============================================="
echo "SUMMARY:"
echo "ICMP (ping) -> Shows Layers 2 to 4"
echo "HTTP (curl) -> Shows Layers 2 to 7"
echo "============================================="
echo "Analysis complete!"
