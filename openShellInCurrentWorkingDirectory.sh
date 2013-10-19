#!/bin/bash

ID=$(xdpyinfo | grep focus | cut -f4 -d " ")

PID=$(($(xprop -id $ID | grep -m 1 PID | cut -d " " -f 3)+1))

if [ -e "/proc/$PID/cwd" ]
then
    urxvt -cd "$(readlink /proc/$PID/cwd)" &
else
    PID2=$(($PID+1))
    if [ -e "/proc/$PID2/cwd" ]
    then
        urxvt -cd "$(readlink /proc/$PID2/cwd)" &
    else
        urxvt
    fi
fi
