#!/usr/bin/env sh

set -e

/lego \
	--accept-tos \
	--dns duckdns \
	--dns.resolvers "1.1.1.1:53, 8.8.8.8:53" \
	--domains *."${DUCKDNS_DOMAIN}" \
	--domains "${DUCKDNS_DOMAIN}" \
	--email "${LETS_ENCRYPT_EMAIL}" \
	run
