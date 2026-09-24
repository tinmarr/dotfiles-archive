#!/usr/bin/env bash
# Script from waybar docs
# https://github.com/Alexays/Waybar/wiki/Module:-Custom:-Simple
set -euo pipefail

readonly ENABLED=''
readonly DISABLED=''
dbus-monitor path='/org/freedesktop/Notifications',interface='org.freedesktop.DBus.Properties',member='PropertiesChanged' --profile |
    while read -r _; do
        PAUSED="$(dunstctl is-paused)"
        if [ "$PAUSED" == 'false' ]; then
            echo "$ENABLED"
        else
            echo "$DISABLED"
        fi
    done
