#!/bin/sh

sessions="$(lsof -Pi | grep ":22")"

if [ ! -z "$sessions" ]; then
    count=$(echo "$sessions" | wc -l)
    echo "$count"
else
    echo "0"
fi
