# Domain Registration

List of free domain services I tried using.

## Set it & Forget it with Cosmos Cloud

Cosmos Cloud uses [lego](https://github.com/go-acme/lego) under the hood.
Thus I restricted my use to only those sub/domain providers which can be used with lego.
This way I can set & forget it, unless I reset my cloud.

| Domain Provider                                | Challenge type | Notes                                 |
| ---------------------------------------------- | -------------- | ------------------------------------- |
| [DuckDNS](https://www.duckdns.org)             | duckdns        |                                       |
| [Get LocalCert](https://www.getlocalcert.net/) | acme-dns       | Strictly for 127.0.0.1                |
| [Dynu DNS](https://www.dynu.com)               | dynu           | Worked with giize.com not freedns.org |

## Unknown

These domains are under testing or approval.

| Domain Provider               | Challenge type | Notes                                  |
| ----------------------------- | -------------- | -------------------------------------- |
| [Obl.ong](https://obl.ong)    |                | Requires approval which can take time. |
| [EU.org](https://nic.eu.org/) |                |                                        |
