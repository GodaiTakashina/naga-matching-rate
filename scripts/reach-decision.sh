#!/bin/sh

jqscripts=./scripts/jq
query="$jqscripts"/reach-decision.jq

reach_decision=$1

cat "$reach_decision" |\
jq -c -f "$query"
