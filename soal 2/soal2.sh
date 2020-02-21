#!/bin/bash

str=$1

if [[ ! "${str//[A-Za-z]/}" = "" ]] ; then echo "Only alphabet allowed"; exit 1; fi 

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

hour=$(date +%H)

echo "$string$hour" > "$1.txt"
