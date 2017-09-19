#!/bin/bash
while true; do
    inotifywait -e modify /var/log/auth.log
    COMMAND="$(less /var/log/auth.log | grep "Accepted password\|Accepted publickey" | tail -5)"
    echo ${COMMAND}
    python $HOME/git/logwatcher/ReportActivity.py "${COMMAND}"
   COMMAND=""
done
