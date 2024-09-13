#!/usr/bin/env sh

set -e

/lego \
  --accept-tos \
  --dns acme-dns \
  --dns.resolvers "1.1.1.1:53, 8.8.8.8:53" \
  --domains "*.${ACMEDNS_FULLDOMAIN}" \
  --domains "${ACMEDNS_FULLDOMAIN}" \
  --email "${LETS_ENCRYPT_EMAIL}" \
  --server https://acme-staging-v02.api.letsencrypt.org/directory \
  run
