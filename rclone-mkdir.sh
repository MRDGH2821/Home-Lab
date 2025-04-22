#!/usr/bin/env bash

# This script creates a directory on a remote storage using rclone.

# Usage: rclone-mkdir.sh <dir_name>

create_directory() {
  local dir_name="$1"
  rclone mkdir pcloud-homelab-data:"$dir_name"
}

preconfigured_paths=("/pgadmin4/var/lib/pgadmin" "/karakeep/data" "/meilisearch/meili_search" "/gamevault/var/lib/postgresql/data" "/gamevault/media" "/gamevault/files")

if [ -z "$1" ]; then
  echo "No path provided. Using preconfigured paths."
  echo "The following paths will be created:"
  for path in "${preconfigured_paths[@]}"; do
    echo "$path"
  done
  read -rp "Do you want to proceed with creating the preconfigured paths? (y/n): " confirm
  if [[ "$confirm" != "y" && "$confirm" != "Y" ]]; then
    echo "Operation canceled."
    exit 0
  fi
  for path in "${preconfigured_paths[@]}"; do
    echo "creating path: $path"
    create_directory "$path"
  done
else
  echo "creating path: $1"
  create_directory "$1"
fi
