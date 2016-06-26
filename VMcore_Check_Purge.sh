#! /bin/bash

# AUTHOR: @TheTunnelix jmutkawoa@hackers.mu

#Check if file vmcore exist more than 40 days if true delete it
purge=`find /var/crash -mtime +40 -type f -name 'vmcore' -exec rm -rf {} \;`

#Check if file vmcore exist
check=`find /home/crash -name "vmcore" -type f`

#Check the size of the vmcore file
size=`du -csh /home/crash/vmcore`

#The "$?" output is passed in the variable Result
Result=$?

#Script start to check
if [ "$Result" -eq 0 ]
then
	echo "vmcore crash detected on Server. Size of file is: $size" | mail -s VMCore detected jmutkawoa@hackers.mu

exit 0

	else

exit 100

fi
