#!/usr/bin/bash

# Original script by Prashant Shrestha 2020-06-23

# get data and initialize array
BATTERY_INFO=($( acpi | awk -F',' '{ print $0 }'))

# format helpers
CHARGE=$((${BATTERY_INFO[3]//%/}))
ICON=""
FORMAT=""

# format battery icon depending on status
if [[ "${BATTERY_INFO[2]}" == *"Charging"* ]]; then
    ICON="🔌"
else
    ICON="🔋"
fi

if [[ $CHARGE -lt 10 ]]; then
    # Red-ish
    FORMAT="%{B#080211}%{F#9E076A}"
elif [[ $CHARGE -lt 30 ]]; then
    # pinker
    FORMAT="%{B#080211}%{F#E51297}"
elif [[ $CHARGE -lt 60 ]]; then
    # pinkerer
    FORMAT="%{B#080211}%{F#FF00E7}"
elif [[ $CHARGE -lt 100 ]]; then
    # blueish
    FORMAT="%{B#080211}%{F#9101E6}"
fi

# format charge and color based on status
FORMAT="$FORMAT$ICON $CHARGE %{B- F-}"

# final output
echo $FORMAT
