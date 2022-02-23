#!/bin/bash

# This script adds users to the same Linux system
# Ali Duong
# User will be prompted to enter the username, real name and password
# After creating the user, the script should show us the username, name , password and host


# Make sure the script is being executed with superuser privileges. (30)
if [ "${UID}" -ne 0 ]
then
	echo "Please login as root user then proceed with the program."
	exit 1
else
	echo "Thanks for running the script as root."
fi
#cd /home/kali/ITP270-Repo-AliDuong

# Get the username (login). (30)
echo "Please type your username"
read USERNAME
# Get the real name (contents for the description field). (30)
echo "Please type your full name"
read FULLNAME
# Get the password. (30)
echo "Please type your password"
read PASSWORD
# Create the user. (30)
useradd -c "$FULLNAME" -m $USERNAME
# Check to see if the useradd command succeeded. (30)
# cat /etc/passwd | grep $USERNAME
if [ "${?}" -ne 0 ]
then
	echo "The account could not be created."
	exit 1
fi
# Set the password. (30)
usermod -p $PASSWORD $USERNAME
# Check to see if the passwd command succeeded. (30)
# cat /etc/shadow | grep $USERNAME
if [ "${?}" -ne 0 ]
then
        echo "The password could not be created."
        exit 1
fi

# Force password change on first login. (30)
chage -d 0 $USERNAME
# Display the username, password, and the host where the user was created. (30)
echo
echo "Username: "
echo $USERNAME
echo
echo "Password: "
echo $PASSWORD
echo
echo "Hostname: "
echo $HOSTNAME
