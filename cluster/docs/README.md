# Glosario

Instituto: El Instituto Nacional de Medicina Genómica.

Clúster Institucional: El grupo de cómputo del Instituto dedicado al cómputo científico.

Nodo: Un equipo de cómputo que forma parte del Clúster Institucional.

# Requerimientos del negocio

## Antecedentes

El Clúster Institucional se adquirió en 2006 después de la mudanza desde Torre Zafiro
se quedó sin utilizar hasta finales de 2017.

En 2017 y debido a la necesidad de terminar el proyecto de [100 Genomas Amerindios](https://gitlab.inmegen.gob.mx/100GMX)
se implementó con servidores y switches del Clúster Institucional de 2006,
y se le agregaron equipos de varios investigadores.
A partir de entonces se utiliza para los análisis de varios Grupos de Investigación del Instituto.

## Oportunidad de negocio



## Objetivos de negocio

Producir artículos científicos.

## Métricas de éxito

Aumentar la cantidad de análisis ejecutados en el clúster institucional en 40% durante 2019.

El sistema debe reducir el tiempo invertido a la configuración de Nodos.

## Declaración de la visión

Para la Subdirección de Bioinformática del Instituto
quien no tiene personal asignado,
el configurador
es un sistema de gestión de la configuración
que permite aprovisionar los servidores del Clúster Institucional,
implementa el sistema de recuperación de desastres del Clúster Institucional,
y funciona como documentación funcional.
A diferencia de la gestión manual
nuestro producto es reproducible, idempotente, mucho más rápido
y no depende del conocimiento de una persona específica.

## Riesgos del negocio

- Fallas frecuentes del sumistro eléctrico del centro de datos.
- Falta de redundancia en la alimentación eléctrica.
- Falta de personal para la gestión de las máquinas.
- Falta de documentación de la infraestructura y organización lógica del centro de datos.
- Etiquetado y conexión deficientes.
- Falta de documentación de los proyectos y sus dependencias.
- Falta de documentación de la arquitectura de los sistemas.
- Falta de requerimientos en la gestión de los proyectos.
- Falta de sistemas de gestión de contraseña.
- Falta de sistema de gestión de configuración.
- Falta de un protocolo para atender incidentes.
- Falta de un plan de recuperación de desastres.
- Costo elevado de mantenimiento de mantener una infraestructura de 2006.
- Alto riesgo de falla para los equipos que ya superaron su vida útil (5 años).
- Falta de redundancia en la arquitectura de los sistemas.
- Falta de automatización de procesos.
- Falta de sistemas para imponer límite bajo de calidad en el desarrollo de sistemas.
- Falta de inversión en mantenimiento de equipos.
- Falta de inversión en renovación tecnológica.

## Suposiciones del negocio y dependencias

- Los sistemas informáticos duran para siempre.
- Las fallas eléctricas no afectan a los equipos.
- Los equipos se configuran y funcionan eternamente.

## Características principales

- Aprovisionamiento de Nodos.

## Alcance de la versión inicial

Gestionar la configuracion de cada función especializada de los Nodos.

## Alcance de las versiones siguientes

Por definir.

## Limitaciones y exclusiones

Este sistema no pretende aprovisionar equipos que no pertenecen al Clúster Institucional.

Este sistema no proporcionará monitoreo de infraestructura.

Tampoco es posible que resuelva todas las necesidades de la Dirección de Desarrollo Tecnológico.

# Contexto de negocio

## Perfiles de involucrados

## Prioridades del proyecto

- Efectuar el Plan de Recuperación de Desastres del Clúster Institucional.

## Consideraciones de implementación

# Actores y sus intereses

- [¿Quién más va a usar el software?]: [¿Qué quiere esa persona?] ([Un campeón que represente este grupo]).
- [¿A quién más le beneficia el software?]: [¿Qué quiere esa persona?].
- Administrador: Resolver problemas del grupo de cómputo del Instituto.
- Subdirector de Bioinformática: Producir 3 flujos de análisis bioinformáticos en 2019.
- Jefe de Supercómputo: Observar mientras se resuelven los problemas del grupo de cómputo del Instituto.
- Director de Desarrollo Tecnológico: Recuperar el grupo de cómputo en caso de falla.
- Investigador: Publicar artículos.
- Estudiante: Obtener su grado académico para tener un trabajo.
- [¿A quién más le afecta el software?]: [¿Qué quiere esa persona?].

# Especificación funcional

Cuando [evento importante]
[este usuario] entra a [esta interfaz]
para [lograr este objetivo],
[el sistema responde de esta manera]
y [entrega este producto].

![Ejemplo de interfaz]

[…(< new fun)]

# Requerimientos de calidad

- [¿La página requiere estar disponible 99.9999% del tiempo?]
- [¿Qué tanta seguridad necesita?]
- [Confiabilidad, ussabilidad, modificabilidad]

# Documentación suplementaria

- [Inventario de equipos en el centro de datos del Instituto](https://docs.google.com/spreadsheets/d/1lcEfaBpBaxbph1b3tyBhJR4_lqlKWNwApUAsPJzhFuc/edit?usp=drive_web&ouid=111454019229199884053)
- [Manual de procedimientos del Instituto](http://www.inmegen.gob.mx/tema/cms_page_media/166/Manual_Procedimientos_Inmegen_2018_18oct18_NI.pdf)
- [MAAGTICSI](https://www.gob.mx/fnd/documentos/manual-administrativo-de-aplicacion-general-en-materia-de-tecnologias-de-la-informacion-y-comunicaciones "Manual Administrativo de Aplicación General en las materias de Tecnologías de la Información, Comunicaciones y Seguridad Informática")
- [Plan Anual de Trabajo del Instituto 2019]()
