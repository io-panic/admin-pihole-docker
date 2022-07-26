#!/bin/sh
cd /bin
/bin/cloudflared proxy-dns --address $CF_LOCAL_ADDR --port $CF_LOCAL_PORT --upstream https://$CF_IP_PRIMARY/dns-query --upstream https://$CF_IP_SECONDARY/dns-query
