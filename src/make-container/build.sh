#!/bin/bash


function display() {

	echo $1
	echo "----------------------------------------------"
	echo
	cat $1
	echo
	echo "**********************************************"
	echo 
}



display prep-newroot.sh
display containerize.sh
display isolate.sh
display networking.sh
display iptables.sh

