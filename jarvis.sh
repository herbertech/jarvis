#!/bin/bash

# JARVIS is an all-in-one tool to easily administer your Linux machine.
# This tool is very simple and modular, you can add your own functions 
# so you don't need to remember all the commands and parameters.

###HELP FUNCTION
showhelp(){
cat << EOF
Hello commander, these are the arguments you can use:
-----------------------------------------------------

help        -> Shows this help message
ip          -> prints the ip address of this machine
hostname    -> prints the hostname of this machine
uptime      -> prints how long this machine has been running

EOF
}

##SHOW IP ADDRESS FUNCTION
showip(){
echo "This machine's IP address is:"
hostname -I
}

##SHOW HOSTNAME FUNCTION
showhost(){
echo "This machines hostname is:"
cat /etc/hostname
}


##SHOW UPTIME FUNCTION
showuptime(){
up=$(uptime -p | cut -c4-)
since=$(uptime -s)
cat << EOF
----------
This machine has been up for ${up}

It has been running since ${since}
----------
EOF
}

case $1 in
    "help")
    showhelp
    ;;
    "ip")
    showip
    ;;
    "hostname")
    showhost
    ;;
    "uptime")
    showuptime
    ;;
    *)
    showhelp
    ;;
esac