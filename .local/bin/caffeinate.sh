#!/bin/bash

# Check if the caffeinate process is running
if ! pgrep -x "caffeinate" > /dev/null
then
    # If caffeinate is not running, start it
    caffeinate -s -i -m &
fi

