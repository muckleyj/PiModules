#!/bin/bash

if [ -t 0 ]; then stty -echo -icanon -icrnl time 0 min 0; fi

count=0
keypress=''
while [ "x$keypress" = "x" ]; do
  clear
  cat /sys/devices/system/cpu/cpu0/cpufreq/*
  echo
  echo Current Frequency 
  cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq
  /opt/vc/bin/vcgencmd measure_temp
  sleep 0.1
  keypress="`cat -v`"
done

if [ -t 0 ]; then stty sane; fi

echo "You pressed '$keypress' after $count loop iterations"
echo "Thanks for using this script."
exit 0
