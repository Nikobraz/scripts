#!/bin/bash
#Example:
# ./destroy-vm.sh hosts

URL_FILE=$1
while read url
do
  VMID=`echo $url | cut -d " " -f 1`
  VMNAME=`echo $url | cut -d " " -f 2`
qm stop $VMID
sleep 4

qm destroy $VMID
ssh-keygen -f /root/.ssh/known_hosts -R 10.74.0.$VMID
done < $URL_FILE