#!/bin/sh

# Generar y configurar par de llaves
ssh-keygen -t rsa -b 4096 -C `hostname`.cluster.inmegen.gob.mx -f ~root/.ssh/`hostname` -P ""
cat <<EOF | sudo tee -a ~root/.ssh/config
Host git.cluster.inmegen.gob.mx
        User gitolite3
        IdentityFile ~root/.ssh/`hostname`
EOF

# Configurar etckeeper
git config --global push.default simple
etckeeper vcs remote remove origin
etckeeper vcs remote add origin gitolite3@git.cluster.inmegen.gob.mx:etckeeper.git

# Instrucciones para agregar la clave pública del server
cat <<EOF
Agrega a gitolite-admin/keydir/`hostname`.pub lo siguiente:

$(cat ~root/.ssh/`hostname`.pub)

ENTER para continuar
EOF
read pato

# Configurar auto-push
sudo etckeeper vcs push -u origin `hostname`
sudo sed -i -e 's#PUSH_REMOTE=""#PUSH_REMOTE="origin"#' /etc/etckeeper/etckeeper.conf
sudo sed -i -e 's#git push "$REMOTE" master || true#git push "$REMOTE" || true#' /etc/etckeeper/commit.d/99push
sudo etckeeper commit -m 'Sincronizar con git.'
