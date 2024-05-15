#!/bin/bash
echo "--------------------------------------"
echo "Welcome to VLAN Interface Manager By Endorium Group."
echo "--------------------------------------"
read -rep "Interface Name : " -i "enp0s3" interface_name
read -rep "address/mask : " -i "192.168.10.10/24" ip_addr
read -rep "VLAN ID : " -i "10" vlan_id



ip link add link $interface_name name $interface_name.$vlan_id type vlan id $vlan_id 2>> error.log

ip addr add $ip_addr dev enp0s3.20 2>> error.log

ip link set dev enp0s3.20 up 2>>error.log

sudo systemctl restart networking && systemctl restart NetworkManager
