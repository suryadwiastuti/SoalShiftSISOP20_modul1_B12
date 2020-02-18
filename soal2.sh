#!/bin/bash

string=""

capital="ABCDEFGHIJKLMNOPQRSTUVWXYZ"
lower="abcdefghijklmnopqrstuvwxyz"

for (( i=1; i<=28; i++))
do
	number=$(($RANDOM%3))
	case $number in
		0)
			random=$(($RANDOM%10))
			string="$string$random"
		;;

		1)
			random=$(($RANDOM%26))
			string="$string${capital:random:1}"
		;;

		2)
			random=$(($RANDOM%10))
			string="$string${lower:random:1}"
		;;
	esac
done

echo $string > "$1.txt"
date +%H >> "$1.txt"
