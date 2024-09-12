# Home Lab

This contains compose files used my me in my home lab. Powered by [Cosmos Cloud](https://cosmos-cloud.io/)

## Apps in HomeLab

| Name                | Cosmos/Self Managed |
| ------------------- | ------------------- |
| Stirling PDF        | Cosmos Managed      |
| ValKey              | Self Managed        |
| PostgreSQL          | Self Managed        |
| pgAdmin4            | Self Managed        |
| Homebox             | Self Managed        |
| Hoarder             | Self Managed        |
| GitLab              | Self Managed        |
| Duckdns-Updater     | Self Managed        |
| Domain-Registration | Self Managed        |
| Jellyfin            | Cosmos Managed      |
| Radarr              | Cosmos Managed      |
| Prowlarr            | Cosmos Managed      |
| Transmission        | Cosmos Managed      |

## DNS Table

| name            | ipv4            | ipv6                 | https                                 | tls                               |
| --------------- | --------------- | -------------------- | ------------------------------------- | --------------------------------- |
| Quad9           | 9.9.9.9         | 2620:fe::fe          | <https://dns.quad9.net/dns-query>     | tls://dns.quad9.net               |
| Quad9 alt       | 149.112.112.112 | 2620:fe::9           |                                       |                                   |
| Cloudflare      | 1.1.1.1         | 2606:4700:4700::1111 |                                       |                                   |
| Cloudflare alt  | 1.0.0.1         | 2606:4700:4700::1001 |                                       |                                   |
| Mullvad AdBlock | 194.242.2.3     | 2a07:e340::3s        | <https://adblock.dns.mullvad.net:443> | tls://adblock.dns.mullvad.net:853 |
| Open DNS        | 208.67.222.222  | 2620:119:35::35      | <https://doh.opendns.com/dns-query>   |                                   |
| Open DNS alt    | 208.67.220.220  | 2620:119:53::53      |                                       |                                   |
