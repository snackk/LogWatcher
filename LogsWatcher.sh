#!/bin/bash

### BEGIN INIT INFO
# Provides: Runs a Python script on startup
# Required-Start: LogsWatcher start
# Required-Stop: LogsWatcher stop
# Default-Start: 2 3 4 5
# Default-stop: 0 1 6
# Short-Description: Simple script to run python program at boot
# Description: Runs a python program at boot
### END INIT INFO

COMMAND="$(less /var/log/auth.log | grep "Accepted password\|Accepted publickey" | tail -1)"
echo ${COMMAND} > /tmp/log
COMMAND=""
while true; do
    inotifywait -e modify /var/log/auth.log
    COMMAND="$(less /var/log/auth.log | grep "Accepted password\|Accepted publickey" | tail -1)"
    echo ${COMMAND} > /tmp/result
    DIFF="$(diff --changed-group-format='%<' --unchanged-group-format='' /tmp/result /tmp/log)"

    if [ "$DIFF" != "" ]; then
        echo ${COMMAND} > /tmp/log
        echo ${DIFF} >> /home/pi/lol
        python /home/pi/git/logwatcher/ReportActivity.py "${DIFF}"
    fi
    COMMAND=""
    DIFF=""
done
