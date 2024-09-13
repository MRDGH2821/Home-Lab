#!/usr/bin/env bash

set -e

# Logging configuration
LOG_FILE="./duckdns_update.log"

# Function to log messages
log() {
    local message="$1"
    local log_message="$(date '+%Y-%m-%d %H:%M:%S') - $message"
    echo $message
    echo $log_message >>"$LOG_FILE"
}

# Function to get the private IP address
get_private_ip() {
    hostname -i | awk '{print $3}'
}

# Function to get the public IP address
get_public_ip() {
    curl -s https://api.ipify.org
}

# Function to check if an IP address is reachable
is_ip_reachable() {
    ping -c 1 "$1" &>/dev/null
    return $?
}

# Function to update DuckDNS
update_duckdns() {
    local ip="$1"
    local url="https://www.duckdns.org/update?domains=${DUCKDNS_DOMAIN}&token=${DUCKDNS_TOKEN}&ip=${ip}"
    response=$(curl -s "$url")
    log "DuckDNS update response: $response"
}

# Main script logic
public_ip=$(get_public_ip)

if [ -n "$public_ip" ] && is_ip_reachable "$public_ip"; then
    log "Public IP $public_ip is reachable. Updating DuckDNS..."
    update_duckdns "$public_ip"
else
    private_ip=$(get_private_ip)
    log "Public IP ($public_ip) not reachable. Updating DuckDNS with private IP $private_ip..."
    update_duckdns "$private_ip"
fi
