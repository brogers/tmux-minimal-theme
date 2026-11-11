#!/usr/bin/env sh

case "$(uname)" in
Linux) free | awk '/^Mem/ { printf("%3.0f%%", $3/$2 * 100 - 0.5) }' ;;
Darwin) memory_pressure -Q | awk '/^System-wide memory free percentage:/ { printf "%3.0f%%", 100 - $5 }' ;;
esac
