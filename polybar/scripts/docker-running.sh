#!/bin/sh
echo "$(expr $(docker ps | wc -l) - 1)"
