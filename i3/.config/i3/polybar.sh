#!/bin/bash
#"chmod +x polybar.sh" to make this executable on new install
# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# Launch polybar
polybar main -r &
polybar secondary -r &
