#!/bin/bash
alarm(){
	read -p "When do you want to remind me?(write in 23:59 format)" time
	hour=$(echo $time | cut -d':' -f1)
	minute=$(echo $time | cut -d':' -f2)
	real_hour=$(date +%H)
	real_minute=$(date +%M)
	if [ $hour -gt $real_hour ] && [ $hour -lt 25 ] && [ $minute -lt 60 ]
	then
		echo "Time will be registered."
	elif [ $hour = $real_hour ] && [ $minute -gt $real_minute ] && [ $minute -lt 60 ]
	then
		echo "Time will be registered."	

	else
		echo "Plase enter valid input!"
		exit 1
	fi
	total_alarm_second=$(($(($hour*3600))+$(($minute*60))))
	total_real_second=$(($(($real_minute*60))+$(($real_hour*3600))))
	total_alarm_second=$(($(($total_alarm_second-$total_real_second))))s
	sleep $total_alarm_second 
	mpg123 alarm.mp3
}

search(){
	
	wikit $1 $2 $3 $4 $5 $6
}
help(){
	echo -e "alarm - if you use alarm terminal will be remained open!"
	echo -e "search - you can use search command to find in wiki. example - search linux , whatis linux"
	echo -e "exit - if you want to exit from shell type 'exit'"
}
joke(){
	num=$[$RANDOM%169+1]
	cat -n jokes.txt | grep $num | head -1
}
weather(){
	curl wttr.in/$1
	echo "*If you don't see all, change the font size smaller.*"
}
fortune
while true
do
	read -p "Zenobia >" input
	case $input in
		"search" ) search
		;;
		"whatis" ) search
		;;
		"alarm" ) alarm
		;;
		"exit" ) exit
		;;
		"help" ) help
		;;
		"tell me a joke" ) joke
		;;
		"Tell me a joke" ) joke
		;;
		"Weather" ) weather
		;;
		"weather" ) weather
		;;
		*)eval "$input"
	esac	
done	

