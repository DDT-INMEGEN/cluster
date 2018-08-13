Configurar el automontado en los nodos
======================================

Para que el automontador funcione,
los directorios que va a gestionar deben estar vacíos.

Hay que activar los puntos de montaje
quitando los módulos de montaje que ya están satisfechos localmente.
El procedimiento se especifica en `scripts/remove-self-references`.


Migración desde montaje por fstab
=================================

El proceso de migración se explica en `docs/automount-configure`
que puede utilizarse para generar el script de configuración:

```
(
echo "#!/bin/bash"
grep -vE '^#' docs/automount-configure
) > scripts/automount-configure
```

El script se ejecuta manualmente
o usando un mecanismo de automatización como ansible.
