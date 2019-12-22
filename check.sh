#!/bin/bash

while true;do

CPU=$(ps -eo pcpu | sort -k 1 -r | head -2 | grep '[9][9].[0-9]') # Check if we have a process that uses 99% of the cpu
printf "CPU is $CPU \n" 
if [ $CPU ];then #if CPU variable is not null, go on.
echo "CPU Load is above 99%, restarting the apache service" 
systemctl restart apache2.service
echo "$(systemctl status apache2.service)" 
fi

sleep 20;
done

#Sources :https://askubuntu.com/questions/754094/i-need-to-write-a-bash-script-to-check-a-service-status-and-restart
#https://www.cyberciti.biz/tips/how-do-i-find-out-linux-cpu-utilization.html
#https://www.linux.com/tutorials/writing-simple-bash-script/
#https://stackoverflow.com/questions/18668556/comparing-numbers-in-bash
#https://www.cyberciti.biz/faq/grep-regular-expressions/
#https://www.cyberciti.biz/faq/unix-linux-bsd-appleosx-bash-assign-variable-command-output/
#https://unix.stackexchange.com/questions/183340/comparing-float-values-in-bash

#Testing
#To console write "yes > /dev/null &" for n times, where n is is the number of your CPU cores.
