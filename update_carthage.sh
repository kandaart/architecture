#!/usr/bin/env bash

set -e
./carthage.sh update --platform iOS --no-use-binaries --cache-builds --new-resolver
osascript -e 'display notification "Carthage update is done" with title "Carthage"'
