#!/bin/bash

echo "editing client configuration file..."
#location of client configuration file
OpenVPNclient=$(/home/matthias/scratch_synced/scripts/openvpnscript/*.ovpn)
#finds the line number before the OpenVPN client settings parameters
line1=$(sed -n '/\}/{n;p;}' $OpenVPNclient)
line1num=$(grep -n "$line1" $OpenVPNclient | cut -d: -f1)
#finds the line number after the OpenVPN client settings parameters
line2=$(sed -n '/<ca>/{g;1!p;};h' $OpenVPNclient)
line2num=$(grep -n "$line2" $OpenVPNclient | cut -d: -f1)

#delete text between lines
sed -ie ''$line1num','$line2num'd' $OpenVPNclient

#finds the line number after which the desire client settings parameters will be pasted
line1paste=$(echo $(($line1num-1)))
#insert text of VPNtext file into line number
sed -ie ''$line1paste'r VPNtext' $OpenVPNclient
echo "...finished"
