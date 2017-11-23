#!/usr/bin/env bash

for i in {1..254}
do
	echo "attempting to turn off 192.168.1.$i"
	./hs100.sh 192.168.1.$i 9999 off
done
