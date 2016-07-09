#!/bin/bash
mpcStatus=`mpc status`
if [[ $mpcStatus == *"paused"* ]]
then
    mpc play
else 
    mpc pause
fi

