#!/usr/bin/env bash
set -e

CSV_FILE="./config.csv"

# Check if the CSV file exists
if [ -f "$CSV_FILE" ]; then
  # Parse the CSV file and create users and databases
  awk -F, 'NR > 1 {print $1, $2, $3}' "$CSV_FILE" | while read -r USERNAME PASSWORD DBNAME; do
    # Create user and database
    psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" -c "CREATE ROLE \"$USERNAME\" WITH INHERIT PASSWORD '$PASSWORD';"
    psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" -c "CREATE DATABASE \"$DBNAME\" OWNER \"$USERNAME\";"
  done
fi
