#!/bin/bash
# Thiago Messias Santos
# São Paulo, 20/05/2026
# Description: Mapping interfaces and routes of local netowrk

echo "============================================="
echo "LOCAL NETWORK MAPPING"
echo "============================================="
echo ""

echo "Network interfaces disponibility:"
ip -c a
echo ""

echo "Routing Table"
ip -c route
echo ""

echo "============================================="
echo "Finished! View your IP route"
