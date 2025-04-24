#!/usr/bin/env bash

# Detect architecture
ARCH=$(uname -m)
IMAGE_NAME="mongo:latest"

# Check for ARM64
if [[ "${ARCH}" = "aarch64" ]] || [[ "${ARCH}" = "arm64" ]]; then
  echo "ARM64 detected. Using ARM mongo 4.4.18"
  IMAGE_NAME="arm64v8/mongo:4.4.18"
# Check for x86_64 without AVX
elif [[ "${ARCH}" = "x86_64" ]]; then
  if ! grep -q avx /proc/cpuinfo; then
    echo "CPU does not support AVX. Using mongo 4.4"
    IMAGE_NAME="mongo:4.4"
  fi
fi

# Export for docker-compose
export MONGO_IMAGE=${IMAGE_NAME}
