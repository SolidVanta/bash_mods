#!bin/bash

$pid

reply=`ps -ue`

readarray -t y <<< "$reply"


#echo ${y[1]}

count=0

for ans in "${y[@]}"; do
    if ! [[ "$count" -eq 0 ]]; then
	echo "$count --->   $ans"
    fi
    if [ "$count" -eq 0 ]; then
	echo "         $ans"
    fi
    ((count++))
done

read -p "Enter the number of the process: " pid
if ! [[ -z "$pid" ]]; then
    echo "${y[$pid]}"
    #echo "${y[$pid]%% *}"
    #tmp="${y[$pid]#*}"
    #echo "${tmp[0]%% *}"
    set ${y[$pid]}
    kill -9 $2
    echo "Process $2 was murdered!!!"
fi
    


