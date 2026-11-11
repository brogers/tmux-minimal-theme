#!/usr/bin/env sh

case "$(uname)" in
    Linux)
        free | awk '/^Mem/ { printf("%3.0f%%", $3/$2 * 100 - 0.5) }'
        ;;
    Darwin)
        vm_stat | awk -v total="$(sysctl -n hw.memsize)" '
            /page size of/ { page_size = $8 }
            /^Anonymous pages:/ { anonymous = $NF }
            /^Pages purgeable:/ { purgeable = $NF }
            /^Pages wired down:/ { wired = $NF }
            /^Pages occupied by compressor:/ { compressed = $NF }
            END {
                if (total <= 0 || page_size <= 0) {
                    print "N/A"
                    exit
                }

                app = anonymous - purgeable
                if (app < 0) app = 0
                printf "%3.0f%%", (app + wired + compressed) * page_size / total * 100
            }
        '
        ;;
esac
