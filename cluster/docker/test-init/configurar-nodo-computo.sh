#!/bin/bash
set -x

#Prerequisitos
apt update
apt-get install -y 9base execline etckeeper

#Copiar la llave privada de computo para solo R de fai
install ~root/.ssh -m 700 -d
curl -L repo.cluster.inmegen.gob.mx/computo.key | tee ~root/.ssh/id_rsa
chmod go-r ~root/.ssh/id_rsa

#Sincronizamos etckeeper
git config --global user.email `hostname`"@cluster.inmegen.gob.mx"
git config --global user.name `hostname`
etckeeper commit -m 'Original config.'
etckeeper vcs remote remove origin
etckeeper vcs remote add origin gitolite3@git.cluster.inmegen.gob.mx:etckeeper.git
etckeeper vcs pull origin auto-conf -X theirs -s recursive --no-edit
etckeeper vcs branch -m `hostname`

# configurar port-mirror
/usr/lib/plan9/bin/mk -f /etc/cluster/mkfile port_mirror
