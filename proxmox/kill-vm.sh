#!/bin/bash
#kill VM on Proxmox or KVM
#Example:
# ./kill-vm.sh 109
vmid=$1
ps aux | grep -v grep | grep "kvm -id $vmid" | awk '{print $2}' | xargs kill -9  
