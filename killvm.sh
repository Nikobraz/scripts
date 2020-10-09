#!/bin/bash
#kill VM on Proxmox or KVM
vmid=$1
ps aux | grep -v grep | grep "kvm -id $vmid" | awk '{print $2}' | xargs kill -9  
