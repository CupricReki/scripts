#!/bin/bash
# Skyler Ogden - Cupricreki@gmail.com
# Simple script to run instead of typing all the update commands

root_shell ()
{ # Test to make sure script was run as root user
	if [ "$EUID" -ne 0 ]; then
		echo "Please run $0 as root, exitting"
		exit 1
	fi
}

system_update ()
{
	printf "\nupdating database\n"
	apt-get update >> /dev/nul
	apt-get -y upgrade
	apt-get -y dist-upgrade
}

cleanup ()
{
	printf "\ncleaning up orphaned dependancies\n"
	apt-get -y autoremove
}

root_shell
system_update
cleanup
exit 0
