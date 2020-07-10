#!/bin/sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Wait until the control has started
polybar level -r &
polybar control -r &
polybar workspace -r &
pgrep spotify && polybar player -r &
polybar open -r &
polybar status -r &
polybar power -r &

while [ -z "$(find /tmp -maxdepth 1 -name "polybar*")" ]; do sleep 1; done
polybar-msg cmd hide &
