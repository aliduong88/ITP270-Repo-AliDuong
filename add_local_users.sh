#!/bin/bash

# Ali Duong
# This script adds two users to the same Linux system

for ((i = 0 ; i < 2 ; i++)); do
	echo "Please type your username"
	read USERNAME


   while true; do	
	echo "Please type your password"
	read PASSWORD
	
	if [[ ${#PASSWORD} -le 8 ]]
	then
	echo "Password must be at least 8 characters long"
	else
	break
	fi
   done

sudo useradd $USERNAME
sudo usermod -p $PASSWORD $USERNAME
echo
echo "Username: "
echo $USERNAME
echo
echo "Password: "
echo $PASSWORD
done
