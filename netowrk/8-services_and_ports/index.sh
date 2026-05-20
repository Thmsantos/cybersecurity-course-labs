#!/bin/bash
# Thiago Messias Santos
# São Paulo, 20/05/2026
# Port Scanning - Local Machine (Nmap)

echo "============================================="
echo "PORT SCANNING - LOCAL MACHINE"
echo "============================================="
echo ""

TARGET="127.0.0.1"

if ! command -v nmap &> /dev/null
then
    echo "Error: nmap is not installed."
    exit 1
fi

echo "Target: $TARGET (localhost)"
echo ""

echo "[1] Quick Scan (Top 1000 ports)"
nmap $TARGET
echo ""

echo "[2] Detailed Scan (Service Detection)"
echo "This may take a bit longer..."

nmap -sV $TARGET
echo ""

echo "[3] Checking Common Ports"

COMMON_PORTS="22 80 443 3306 8080"

for PORT in $COMMON_PORTS
do
    echo -n "Port $PORT: "
    nc -z localhost $PORT > /dev/null 2>&1

    if [ $? -eq 0 ]; then
        echo "OPEN"
    else
        echo "CLOSED"
    fi
done

echo ""
echo "============================================="
echo "SUMMARY:"
echo "- Open ports → Running services"
echo "- Closed ports → No active service"
echo "- Use 'nmap -sV' to identify services"
echo "============================================="
echo "Done!"