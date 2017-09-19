#!/bin/bash
while true; do
    inotifywait -e modify /var/log/auth.log
    COMMAND="$(less /var/log/auth.log | grep "Accepted password\|Accepted publickey" | tail -5)"
    echo ${COMMAND}
    python /home/pi/Downloads/ReportActivity.py "${COMMAND}"
   COMMAND=""
done
