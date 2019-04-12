---
title: Gestión de usuarios del clúster institucional
author: Joshua Haase
date: 2019-04-12
---

# Antecedentes

Anteriormente se utilizaba un sistema NIS+
que frecuentemente ocasionaba a los usuarios tiempos de espera de 15 minutos.

Para mitigar ese problema se decidió [sincronizar los archivos de autenticación](https://lists.suckless.org/dev/1407/23080.html) desde el Nodo de Usuarios.

# Implementación

Los usuarios se administran desde `castillo`,
que es el Nodo de Usuarios del Clúster Institucional.

La implementación consiste en:

- Los usuarios se agregan desde el Nodo de Usuarios
  con [este procedimiento](https://gitlab.inmegen.gob.mx/cluster/docs/blob/master/usuarios-y-grupos-cluster.md).

- El Nodo de Usuarios del Clúster Institucional
  sincroniza automáticamente su configuración con el Nodo de Configuración.

- Cada Nodo de Cómputo sincroniza `/etc/passwd`, `/etc/shadow` y `/etc/group`.

Al final de este procedimiento, cada Nodo del Clúster Institucional tiene la configuración de usuarios local.
