#!/bin/sh

jqscripts=./scripts/jq
query="$jqscripts"/aggregate.jq

diff="$1"
cat "$diff" | jq -f "$query"
