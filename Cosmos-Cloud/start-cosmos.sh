#!/usr/bin/env bash

SCRIPT_PATH="$(realpath "${BASH_SOURCE[0]}")"
SCRIPT_DIR="$(dirname "${SCRIPT_PATH}")"

# shellcheck disable=SC1091
source "${SCRIPT_DIR}"/detect-arch.sh

# Export for docker-compose
export MONGO_IMAGE=${IMAGE_NAME}
docker compose -f "${SCRIPT_DIR}"/docker-compose.yml up -d
