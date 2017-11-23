#!/bin/bash
while [ "true" ]
do
	VPNCON=$(nmcli con status)
	if [[ $VPNCON != "US Midwest" ]]; then
		echo "Disconnected, trying to reconnect..."
		(sleep 1s && nmcli con up uuid e5e3f609-5755-4cc2-a168-a673e8aa8df5)
	else
		echo "Already connected !"
	fi
	sleep 30
done
