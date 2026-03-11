#!/usr/bin/env bash

if ip link show ppp0 >/dev/null 2>&1; then
    echo "VPN 🟢"
else
    echo "VPN 🔴"
fi

