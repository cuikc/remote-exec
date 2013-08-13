#!/bin/bash


if [ -z "$1" ]; then
echo "Usage: sh $0 [IP Or IPFILE]"
exit
fi

if [ -f "$1" ]; then
SERVERS=$(cat "$1")
else
SERVERS=$1
fi

USER='root'

for IP in $SERVERS
do

echo $IP

ssh -o ConnectTimeout=5 -o StrictHostKeyChecking=no $USER@${IP} "ps aux | grep zabbix && tail /usr/local/etc/zabbix_agentd.conf"

echo

done
