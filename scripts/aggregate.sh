#!/bin/sh

jqscripts=./scripts/jq
query="$jqscripts"/aggregate.jq

dahai_diff=$1
reach_decision=$2

jq -n \
    --slurpfile dahai_diff "$dahai_diff" \
    --slurpfile reach_decision "$reach_decision" \
    -f "$query"
