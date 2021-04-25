#!/bin/bash
#Example:
# ./create-vm.sh 255 fcos-vm

URL_FILE=$1
while read url
do
  VMID=`echo $url | cut -d " " -f 1`
  VMNAME=`echo $url | cut -d " " -f 2`

  qm clone 9000 $VMID --name $VMNAME
  qm resize $VMID scsi0 +50G
  qm set $VMID --ipconfig0 gw=10.74.0.1,ip=10.74.0.${VMID}/24 --nameserver 10.74.0.102 --searchdomain nikobraz.loc --sshkeys ~/.ssh/kuber.pub
  qm start $VMID
done < $URL_FILE