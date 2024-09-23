#!/usr/bin/env bash

# Logging configuration
LOG_FILE="./Dynudns_update.log"
source .env
# Function to log messages
log() {
    local message="$1"
    local log_message
    log_message="$(date '+%Y-%m-%d %H:%M:%S') - ${message}"
    echo "${message}"
    echo "${log_message}" >>"${LOG_FILE}"
}

# Function to get the private IP address
get_private_ip() {
    # shellcheck disable=SC2312
    ip addr show | grep "inet " | grep -v "127.0.0.1" | awk '{print $2}' | cut -d '/' -f 1 | grep 192
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

# Function to update dynuDNS
update_dynudns() {
    local ip="$1"
    local url="https://api.dynu.com/nic/update?hostname=${DYNU_SUBDOMAIN}&username=${DYNU_USERNAME}&password=${DYNU_PASSWORD_HASH}&mpip=${ip}"
    response=$(curl -s "${url}")
    log "Dynu DNS update response: ${response}"
}

# Main script logic
public_ip=$(get_public_ip)

if [[ -n ${public_ip} ]] && is_ip_reachable "${public_ip}"; then
    log "Public IP ${public_ip} is reachable. Updating DynuDNS..."
    update_dynudns "${public_ip}"
else
    private_ip=$(get_private_ip)
    log "Public IP (${public_ip}) not reachable. Updating DynuDNS with private IP ${private_ip}..."
    update_dynudns "${private_ip}"
fi



