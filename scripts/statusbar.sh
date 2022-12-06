fcitx5 -d

dwm_datetime(){
    echo $(date "+%y-%m-%d %a %T")
}

dwm_battery() {
    capacity=$(cat /sys/class/power_supply/BAT0/capacity)
    status=$(cat /sys/class/power_supply/BAT0/status)

    if [ ${status} = "Charging" ]
    then
        echo "Charging:${capacity}%"
    else
        echo "Using:${capacity}%"
    fi
}

data=$(dwm_datetime) #init datetime
battery=$(dwm_battery) #init battery

while true
do
    for i in $(seq 1 1800)
    do
        if [ $(expr ${i} % 1) -eq 0 ] #update each 0.5s
        then
            data=$(dwm_datetime)
        fi
        
        if [ $(expr ${i} % 2) -eq 0 ] #update each 1s
        then
            battery=$(dwm_battery)
        fi
        
        xsetroot -name "|${battery}|${data}"
        sleep 0.5
    done
done
