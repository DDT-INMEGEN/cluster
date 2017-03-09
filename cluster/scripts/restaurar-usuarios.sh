#!/bin/sh
PKGDIR=/var/cache/apt-cacher/packages

# Buscar los paquetes instalados
paquetes_instalados() {
  dpkg --get-selections \
  | awk '{print $1}'
}

escapar_caracteres() {
  sed -r -e 's#([+()|-])#\\\1#g' "$@"
}

patron_de_paquetes() {
  paquetes_instalados \
  | escapar_caracteres \
  | sed -r -e 's#^#^#' -e 's#$#_#'
}

# Buscar los permisos en el almacén de paquetes
paquetes_en_almacen() {
  ls $PKGDIR \
  | grep -E -f <(patron_de_paquetes) \
  | sed -r -e 's#^#'"$PKGDIR"'#'
}

permisos_a_chmod() {
  awk '{
    perms = $1
    type = substr(perms, 1, 1)
    user = substr(perms, 2, 3)
    group = substr(perms, 5, 3)
    other = substr(perms, 8, 3)
    file = $6
    gsub("-", "", user)
    gsub("-", "", group)
    gsub("-", "", other)
    print "chmod u=" user ",g=" group ",o=" other " " file
  }'
}

ignorar_enlaces() {
  grep -vE '^[lh]'
}

ignorar_root() {
  # root siempre es el usuario 0,
  # no es necesario restaurar propiedad del archivo
  awk '$2 != "root/root"'
}

permisos_en_paquete() {
  xargs -l dpkg -c \
  | ignorar_enlaces
}

permisos_a_chown() {
  awk 'BEGIN {permiso=1; usuario=2; archivo=6}
  {
    sub("/", ":", $usuario)
    print "chown " $usuario " " $archivo
  }'
}

dpkg_reconfigure() {
   xargs -l sudo dpkg-reconfigure
}
