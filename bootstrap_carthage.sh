#!/usr/bin/env bash

set -e
./carthage.sh bootstrap --platform ios --no-use-binaries --cache-builds
osascript -e 'display notification "Carthage bootstrap is done" with title "Carthage"'
