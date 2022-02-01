#!/bin/sh

jqscripts=./scripts/jq
query="$jqscripts"/reach-data.jq

last_player=3

playerinfo="$1"
pred="$2"

for player in `seq 0 "$last_player"`; do
    # extract player name
    name=`cat "$playerinfo" |\
        jq -r -M --argjson player "$player" \
            '.name[$player]'`
    # calculate dahai diff
    cat "$pred" |\
    jq -c -M \
        --argjson player "$player" \
        --arg name "$name" \
        -f "$query"
done
