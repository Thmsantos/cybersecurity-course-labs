#!/bin/bash
# Thiago Messias Santos
# São Paulo, 20/05/2026
# TCP/IP and Network Architecture - Route Mapping

TARGET="1.1.1.1" # Cloudflare DNS

echo "============================================="
echo "🌍 INTERNET ROUTE MAPPING"
echo "============================================="
echo ""

echo "Target: $TARGET"
echo "Tracing the path from your machine to the destination..."
echo "Each hop represents a router between you and the server."
echo ""

if ! command -v tracepath &> /dev/null
then
    echo "Error: tracepath is not installed."
    echo "Install it using: sudo apt install iputils-tracepath"
    exit 1
fi

tracepath -m 15 $TARGET

echo ""
echo "1. The first hop is usually your local router."
echo "2. Next hops belong to your ISP."
echo "3. Then traffic enters the internet backbone."
echo "4. The last hop is the destination server."
echo ""
echo "============================================="
echo "Analysis complete!"