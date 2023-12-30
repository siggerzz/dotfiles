#!/usr/bin/env bash

echo "Checking Bitwarden login status..."

# Check Bitwarden login status
BW_STATUS=$(bw status | jq -r '.status')

# Determine the login status and act accordingly
if [ "$BW_STATUS" != "unauthenticated" ]; then
    echo "You are already logged into Bitwarden. Current status: $BW_STATUS"
else
    echo "You are not logged into Bitwarden. Please login to proceed."
    echo "Login with Bitwarden CLI:"
    read -p "Your Bitwarden email: " BW_EMAIL
    read -s -p "Your Bitwarden master password: " BW_PASSWORD
    echo

    BW_SESSION=$(bw login "$BW_EMAIL" "$BW_PASSWORD" --raw)
    export BW_SESSION
fi

bw sync