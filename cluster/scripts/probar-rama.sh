#!/bin/sh
RAMA="$1"
sudo etckeeper commit -m "Antes de probar rama $RAMA"
sudo etckeeper vcs pull origin $RAMA -X theirs -s recursive --no-edit
