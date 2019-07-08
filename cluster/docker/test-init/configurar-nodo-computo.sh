#!/bin/bash
set -x

# Copiar la llave privada de computo para leer configuración
install ~root/.ssh -m 700 -d
curl -L repo.cluster.inmegen.gob.mx/computo.key | tee ~root/.ssh/id_rsa
curl -L repo.cluster.inmegen.gob.mx/known_hosts | tee ~root/.ssh/known_hosts
chmod go-r ~root/.ssh/id_rsa

# Instalar requisitos
curl repo.cluster.inmegen.gob.mx/supercomputo.asc | apt-key add -
apt update
apt-get install -y 9base etckeeper s6 execline

# Sincronizar etckeeper
git config --global user.email `hostname`"@cluster.inmegen.gob.mx"
git config --global user.name `hostname`
etckeeper commit -m 'Original config.'
etckeeper vcs remote remove origin
etckeeper vcs remote add origin gitolite3@git.cluster.inmegen.gob.mx:etckeeper.git
etckeeper vcs pull origin auto-conf -X theirs -s recursive --no-edit --allow-unrelated
etckeeper vcs branch -m `hostname`

# Ejecutar configurador
mkdir -p /var/lib/cluster
/etc/cron.hourly/configurador
