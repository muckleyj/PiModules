#!/bin/bash

if [ -t 0 ]; then stty -echo -icanon -icrnl time 0 min 0; fi

clear
fulload() { dd if=/dev/zero of=/dev/null | dd if=/dev/zero of=/dev/null | dd if=/dev/zero of=/dev/null | dd if=/dev/zero of=/dev/null & }; fulload
echo CPU Full Load

count=0
keypress=''
while [ "x$keypress" = "x" ]; do
  sleep 0.5
  keypress="`cat -v`"
done

if [ -t 0 ]; then stty sane; fi

sudo killall dd
echo "Thanks for using this script."
exit 0
