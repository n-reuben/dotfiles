#!/bin/bash
#"chmod +x polybar.sh" to make this executable on new install
# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# Launch polybar
polybar workspace -r &
polybar music -r &
polybar player -r &
polybar close -r &
polybar notify -r &
polybar open -r &
polybar status -r &
polybar power -r &




