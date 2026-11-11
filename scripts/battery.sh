#!/usr/bin/env sh

# Prints battery capacity with a trailing % only when a valid number is found.
case "$(uname)" in
    Linux)
        c=$(cat /sys/class/power_supply/BAT*/capacity 2>/dev/null)
        ;;
    Darwin)
        c=$(pmset -g batt | grep -Eo '[0-9]+%' | tr -d %)
        ;;
esac

case "$c" in
    ''|*[!0-9]*)
        echo 'N/A'
        ;;
    *)
        echo "${c}%"
        ;;
esac
