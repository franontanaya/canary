#!/bin/bash
while true
do
	t=$(sensors|grep Core|awk '{print $3}'|cut -b2,3|awk '{if (NR==1) print $1}');
	brake=$(ps -e|grep cpulimit);
	if [[ $t >= 65 && ! $brake ]]; then
		cpulimit -e minerd -l 99 -b > /dev/null 2>&1;
		echo "Temperature is $t. Throttling down...";
		sleep 15;
	elif [[ $t < 65 && $brake ]]; then
		killall cpulimit;
		echo "Temperature is $t. Throttling up...";
		sleep 5;
	else
		sleep 3;
	fi
done
