# OSI Model Packet Analysis Script

- Thiago Messias Santos
- São Paulo, 20/05/2026

## Description

This Bash script demonstrates how network packets travel through different layers of the OSI model using real traffic capture.

It uses:
- `ping` (ICMP) to show lower layers
- `curl` (HTTP) to show application layer data
- `tcpdump` to capture and display packets

## What it shows

- Layer 2 (Data Link): MAC addresses  
- Layer 3 (Network): IP addresses  
- Layer 4 (Transport): ICMP / TCP  
- Layer 7 (Application): HTTP data (GET requests, headers)