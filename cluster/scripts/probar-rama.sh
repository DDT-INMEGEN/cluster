#!/bin/sh
RAMA="$1"
sudo etckeeper commit -m "Antes de probar rama $RAMA"
sudo etckeeper vcs pull origin $RAMA -X theirs -s recursive --no-edit
sudo etckeeper init
sudo /etc/cron.hourly/configurador
sudo etckeeper commit -m "Después de probar rama $RAMA"
sudo etckeeper vcs push origin