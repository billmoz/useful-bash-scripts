#!/bin/bash
# bash script to update Namecheap.com dynamic dns
# /usr/local/bin/update-ddns-namecheap.sh

DDNS_HOSTNAME="hostname"
DDNS_DOMAIN="domain.com"
# Get DDNS_PASSWORD from Namecheap.com
DDNS_PASSWORD="XXXXXXXXXXXXXXXXXXXX"
LOGFILE="/path/to/logs/update-ddns-namecheap.log"
CURRENT_DATE=$(date)

CURRENT_IP=$(curl -s myip.dnsomatic.com)
if [[ "$DDNS_HOSTNAME" == "@" ]]; then
  CURRENT_DDNS=$(dig +short $DDNS_DOMAIN @dns1.registrar-servers.com)
else
  CURRENT_DDNS=$(dig +short $DDNS_HOSTNAME.$DDNS_DOMAIN @dns1.registrar-servers.com)
fi

echo "$CURRENT_DATE | MyIP=$CURRENT_IP | DDNS-IP=$CURRENT_DDNS | $DDNS_HOSTNAME.$DDNS_DOMAIN" >> $LOGFILE

if [ "$CURRENT_DDNS" != "$CURRENT_IP" ]; then
    curl "https://dynamicdns.park-your-domain.com/update?host=$DDNS_HOSTNAME&domain=$DDNS_DOMAIN&password=$DDNS_PASSWORD&ip=$CURRENT_IP"
fi
