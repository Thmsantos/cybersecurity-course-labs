#!/bin/bash
# Thiago Messias Santos
# São Paulo, 20/05/2026
# IPv6 Introduction - Addressing and Connectivity Test

echo "============================================="
echo "IPv6 ANALYSIS"
echo "============================================="
echo ""

if ! command -v ip &> /dev/null
then
    echo "Error: 'ip' command not found."
    exit 1
fi

echo "[1] Displaying IPv6 addresses on this machine:"
ip -6 addr show
echo ""

echo "Note:"
echo "::1 is the IPv6 loopback address (equivalent to 127.0.0.1 in IPv4)."
echo ""

echo "[2] Testing local IPv6 connectivity (ping ::1)..."

ping -6 -c 3 ::1 > /dev/null 2>&1

if [ $? -eq 0 ]; then
    echo "Ping successful"
else
    echo "Ping failed"
fi
echo ""

echo "[3] Testing external IPv6 connectivity (Google DNS)..."
echo "Target: 2001:4860:4860::8888"

ping -6 -c 3 2001:4860:4860::8888 > /dev/null 2>&1

if [ $? -eq 0 ]; then
    echo "External IPv6 connectivity OK"
else
    echo "No external IPv6 connectivity"
fi
echo ""

echo "============================================="
echo "TIP:"
echo "To access an IPv6 address in a browser, use brackets:"
echo "Example: http://[2001:db8::1]/"
echo "============================================="
echo "Done!"