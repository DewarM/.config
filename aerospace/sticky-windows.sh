#!/usr/bin/env sh
# https://github.com/nikitabobko/AeroSpace/issues/2
# Largely derivce from user script to support pip windows.
# This script will auto moves Outlook Reminder windows. 

all_wins=$(aerospace list-windows --all --format '%{window-id}|%{app-name}|%{window-title}|%{monitor-id}|%{workspace}')
current_ws=$(aerospace list-workspaces --focused --format '%{workspace}|%{monitor-id}')

# Array of possible window titles
reminder_window_titles=("Reminder")

find_reminder_windows() {
  local titles=("$@")
  local result=""
  for title in "${titles[@]}"; do
    local matches=$(printf '%s\n' "$all_wins" | rg "$title")
    result="$result"$'\n'"$matches"
  done
  echo "$result" | sed '/^\s*$/d' # Remove empty lines
}
#
reminder_windows=$(find_reminder_windows "${reminder_window_titles[@]}")
target_mon=$(echo $current_ws | cut -d'|' -f2 | xargs)

move_win() {
  local win="$1"

  [[ -n $win ]] || return 0

  local win_mon=$(echo "$win" | cut -d'|' -f4 | xargs)
  local win_id=$(echo "$win" | cut -d'|' -f1 | xargs)
  local win_app=$(echo "$win" | cut -d'|' -f2 | xargs)
  local win_ws=$(echo "$win" | cut -d'|' -f5 | xargs)

  local ws=$(echo "$current_ws" | cut -d'|' -f1 | xargs)
  # Skip if the monitor is already the target monitor or if the workspace matches
  # [[ $target_mon != "$win_mon" ]] && return 0
  [[ $ws == "$win_ws" ]] && return 0

  aerospace move-node-to-workspace --window-id "$win_id" "$ws"
}

echo "$reminder_windows" | while IFS= read -r win; do
echo win: $win
  move_win "$win"
done
