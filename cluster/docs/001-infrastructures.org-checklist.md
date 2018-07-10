# Manejo de infraestructura

## Control de versiones

Se utiliza `etckeeper` para mantener las siguientes clases de servidores:

- Nodo de cómputo
- Nodo de almacenamiento
- Nodo interactivo

Se requiere:

- Instalar el software requerido
- Configurar los exports
- Configurar los puntos de montaje

### Documentación

La documentación del clúster se encuentra en `gitolite3@fai:usb`

- Configurar git.inmegen.gob.mx.
    - Agregar repo de `usb`.

## Servidor dorado

**PENDIENTE** Instalación de FAI (Iber).
**PENDIENTE** Actualizar git en fai.

Los cambios se deben agregar a este servidor.
Todos los nodos deben jalar los cambios de aquí.

La implementación se hace mediante un crontab que:

- Sincronice la configuración de la rama correspondiente de etckeeper.
- Ejecute el mkfile para realizar las configuraciones necesarias.
- **PENDIENTE** Instalar paquetes en las clases.

## Servidor de instalación de nodos

Este servidor administra qué se instala y dónde.
Es preferible que se encuentre en el servidor dorado,
pero si hay demasiados nodos, debe distribuirse la carga.

### Configuración de nodos de cómputo {#computo}

- **PENDIENTE** Configurar las interfaces de red.
    - **PENDIENTE** Agregar los dos sabores de configuración (por tipo de máquina)
        en `/etc/
- **PENDIENTE** Cambiar config de R para apuntar al dominio cran.inmegen.gob.mx, bioconductor.inmegen.gob.mx.

#### Referencias {#referencias}

Los nodos de cómputo deben contener las referencias para mejorar el rendimiento.
Se configurará una sincronización diaria en horario nocturno ¿o cuando se agrega un archivo?.

La referencia debe agregarse como sólo lectura.
Se generarán los índices pertinentes.
Se hará comprobación del contenido por resumen criptográfico.

Si los nodos no tienen espacio suficiente,
¿usar bit-torrent-filesystem para transferir los datos?

## Herramienta para cambios inmediatos

Se recomienda una herramienta que active el halar de cambios.
Puede ser un guión sencillo.

La herramienta está implementada como un guión que se ejecuta cada hora:

```
/etc/cron.hourly/configurador
```

## Servidores de Directorio

Se recomienda:

- Servidor de nombres para hosts (fai).

    Se configuró djbdns para tomar la configuración de DNS en goldserver.
    Desde el DNS del instituto, se delegó el dominio .cluster.inmegen.gob.mx
    se configuró el cache DNS para consultar este servidor autoritativo.

Scripts de configuración usan alias del DNS.

Se instaló el gestor de DNS `djbdns` de acuerdo con [este foro de ubuntu][dns].
Se generó un guión de awk que genera la configuración de tinydns
a partir de `/etc/hosts`.

Se documentó el procedimiento en `/procedimientos/dns.md`

[dns]: https://ubuntuforums.org/showthread.php?t=1630044

## Almacenamiento y Repositorios

Se sincronizaron los datos de los usuarios en notron.

### Necesidades

- Repo APT
- CRAN
- Bioconductor
- 100g
- TCGA
- EXACt (70000g)
- COSMIC
- 1000g
- 10000g

Guardar todos los fastqc como SRA.

#### 100g

Queremos un sitio web (servidor).

## Servidores de Autenticación

Se recomienda LDAP+KRB.

## Sincronización de tiempo

Se utiliza el servicio `timedatectl` para la configuración del tiempo.

https://help.ubuntu.com/lts/serverguide/NTP.html

## Replicación de archivos

## Acceso a Datos de clientes

## Actualizaciones

## Gestión de la configuración del cliente

## Gestión de las aplicaciones del cliente

## Correo

**PENDIENTE**: Sistema de tickets

Condor tendrá una cuenta de correo <condor@inmegen.gob.mx> y
enviará correos personales al terminar la ejecución.

## Impresión

## Monitoreo

## Respaldos

Implementar http://www.amanda.org/ o similar.

**EN_PROCESO**(Alejandro): Se configuró el robot de cintas.

# Disposición de los equipos

Son dos gabinetes energizados.

## De vista a los usuarios

Se tiene un nodo de entrada que se llama arenero
