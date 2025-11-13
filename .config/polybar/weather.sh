#!/bin/sh

city="Hanoi"
city_cryptic=$(echo "$city" | sed 's/ /_/g')

format=$(curl -s "wttr.in/$city_cryptic?format=%c%t" | sed 's/️//g')

if ! echo "$format" | grep -q "Unknown"; then
  icon=$(echo "$format" | sed -E 's/(.).*/\1/')
  temp=$(echo "$format" | sed -E 's/^.//')
  echo "%{T2}$icon %{T1}$temp" | sed -e 's/  / /g' -e 's/+//g'
else
  echo "%{T1}+0°C"
fi
