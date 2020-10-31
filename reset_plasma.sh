kbuildsycoca5  &>/dev/null
timeout 5 kquitapp5 plasmashell $>/dev/null
pgrep -U $USER -x plasmashell &>/dev/null && pkill -U $USER -x plasmashell &>/dev/null
pgrep -U $USER -x plasmashell &>/dev/null && pkill -U $USER -x -9 plasmashell &>/dev/null
pgrep -U $USER -x plasmashell &>/dev/null && echo "ERROR: cannot kill plasmashell"
plasmashell &>/dev/null &
