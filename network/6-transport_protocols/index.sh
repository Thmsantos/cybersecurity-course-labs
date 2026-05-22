#!/bin/bash
# Thiago Messias Santos
# São Paulo, 20/05/2026
# TCP vs UDP - Practical Demonstration

echo "============================================="
echo "TCP vs UDP DEMONSTRATION"
echo "============================================="
echo ""

if ! command -v nc &> /dev/null
then
    echo "Error: netcat (nc) is not installed."
    exit 1
fi

TCP_PORT=4444
UDP_PORT=5555

echo "[1] TCP TEST"
echo "Starting TCP server on port $TCP_PORT..."

nc -l $TCP_PORT > tcp_received.txt &
TCP_PID=$!
sleep 1

echo "Sending message via TCP..."
echo "Hello via TCP" | nc localhost $TCP_PORT
sleep 1

if [ -s tcp_received.txt ]; then
    echo "Received message:"
    cat tcp_received.txt
    echo "TCP communication successful"
else
    echo "TCP communication failed"
fi

rm -f tcp_received.txt
kill $TCP_PID 2>/dev/null
echo ""

echo "[2] UDP TEST"
echo "Starting UDP server on port $UDP_PORT..."

nc -u -l $UDP_PORT > udp_received.txt &
UDP_PID=$!
sleep 1

echo "Sending message via UDP..."
echo "Hello via UDP" | nc -u localhost $UDP_PORT
sleep 1

if [ -s udp_received.txt ]; then
    echo "Received message:"
    cat udp_received.txt
    echo "UDP communication successful"
else
    echo "UDP communication may have failed"
    echo "(UDP is connectionless and does not guarantee delivery)"
fi

rm -f udp_received.txt
kill $UDP_PID 2>/dev/null

echo ""
echo "============================================="
echo "SUMMARY:"
echo "TCP → Reliable, connection-oriented"
echo "UDP → Fast, connectionless, no guarantee"
echo "============================================="
echo "Done!"
