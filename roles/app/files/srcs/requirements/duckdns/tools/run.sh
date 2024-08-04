#!/bin/sh

echo "Updating ip for domains: $DOMAINS"

if [ -n "$IP" ]; then
  echo "using ip: $IP"
fi

echo "$(curl "https://www.duckdns.org/update?domains=$DOMAINS&token=$TOKEN&ip=$IP")"