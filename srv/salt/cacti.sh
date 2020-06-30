#!/bin/bash
#Get minion hostnames
sudo salt '*' state.apply
minions="$(sudo salt '*' cmd.run "hostname -A")"
#Add minions to cacti
for i in $minions; do
	if [[ "$i" != *":"* ]]; then
		sudo php -q /usr/share/cacti/cli/add_device.php --description="$i" --ip="$(sudo salt $i cmd.run "hostname -i" | sed -e '2!d')" --template=1 --avail=snmp --ping_method=tcp --ping_port="161" --ping_retries=5 --version=3 --port=161 --timeout=5000 --username="authPrivUser" --password="password" --authproto="MD5" --privpass="password" --privproto="DES"
	fi
done
#add graphs to minions in cacti
sudo php -q /usr/share/cacti/cli/add_graphs.php --list-hosts | tail -n +2 | while read line ; do 
	sudo php -q /usr/share/cacti/cli/add_graphs.php --graph-type=cg --graph-template-id=1 --host-id=$(echo $line | cut -c-1)
done

