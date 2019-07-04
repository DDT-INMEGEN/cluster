# Glosario

Instituto: El Instituto Nacional de Medicina Genómica.

Clúster Institucional: El grupo de cómputo del Instituto dedicado al cómputo científico.

Nodo: Un equipo de cómputo que forma parte del Clúster Institucional.

# Requerimientos del negocio

## Antecedentes

El Clúster Institucional se adquirió en 2006.
Después de la mudanza desde Torre Zafiro se quedó sin utilizar hasta finales de 2017.

En 2017 y debido a la necesidad de terminar el proyecto de [100 Genomas Amerindios](https://gitlab.inmegen.gob.mx/100GMX)
se implementó con servidores y switches del Clúster Institucional de 2006,
y se le agregaron equipos de varios investigadores.
A partir de entonces se utiliza para los análisis de varios Grupos de Investigación del Instituto.

## Oportunidad de negocio

Utilizando metodologías de desarrollo de última generación
podemos aumentar la capacidad de análisis bioinformáticos del Instituto
para aumentar la productividad científica del Instituto.

Tener en marcha estas características nos permitiría
justificar una renovación tecnológica para aprovechar mejor los recursos
o migrar a un esquema de servicio en la nube.

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
- Falta de personal capacitado para la administración de equipos.
- Falta de personal capacitado para desarrollo de flujos bioinformáticos.
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
- La especificación ad-hoc de actividades.
- Operar en modo apagar incendios.

## Suposiciones del negocio y dependencias

- Los sistemas informáticos duran para siempre.
- Las fallas eléctricas no afectan a los equipos.
- Los equipos se configuran y funcionan eternamente.
- La administración de equipos no consume tiempo ni requiere personal.
- Mantener la infraestructura es una actividad que no requiere invertir recursos ni impacta en la producción científica.

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

Director de Desarrollo Tecnológico

: Dr. en Ciencias con experiencia en investigación y gestión de tecnología.

Subdirector de Bioinformática

: Ing. en Biotecnología con experiencia en seguridad informática,
tecnologías de la información y telecomunicaciones.

Jefe de Supercómputo

: Biólogo con doctorado que se rumora que se lo sacó su jefe,
sin intención en apoyar en el desarrollo de la infraestructura.

Ing. Biomédico asignado a la Subdirección de Bionformática

: Ing. Biomédico con experiencia en gestión de infraestructura hospitalaria.

## Prioridades del proyecto

- Validar el Plan de Recuperación de Desastres del Clúster Institucional.

## Consideraciones de implementación

Este proyecto se basa en herramientas de código abierto.
Se busca que sea la implementación más sencilla que cubra las necesidades de infraestructura de cómputo científico del Instituto.

# Actores y sus intereses

- Administrador: Resolver problemas del grupo de cómputo del Instituto.
- Subdirector de Bioinformática: Producir 3 flujos de análisis bioinformáticos en 2019.
- Subdirector de Genómica Poblacional: Crecer su grupo de investigación para tener más productividad so pretexto de las necesidades Bionformáticas del Instituto.
- Subdirector de Aplicaciones Clínicas: Tener una interfaz más amigable para entregar a sus clientes los análisis de las Unidades de Alta Tecnología.
- Jefe de Supercómputo: Observar mientras se resuelven los problemas del grupo de cómputo del Instituto.
- Director de Desarrollo Tecnológico: Recuperar el grupo de cómputo en caso de falla.
- Director del Instituto: Desarrollar y ostentar las capacidades de análisis genómico del Instituto.
- Investigador: Publicar artículos.
- Estudiante: Obtener su grado académico mediante trabajos de investigación.

# Especificación funcional

Cuando se adquiere un nuevo nodo del Clúster Institucional,
el Administrador utiliza este sistema
para aprovisionar el equipo,
el equipo queda instalado sin intervención humana
y está listo para usarse en el Clúster Institucional.

Cuando un nodo falla,
el Administrador resuelve el problema físico
y usa este sistema para aprovisionar un nodo para reemplazarlo,
el nodo queda listo para utilizarse.

Cuando falla un nodo y no hay recursos para repararlo físicamente,
el Administrador utiliza este sistema para aprovisionar un nodo que cumpla con los requisitos del sistema
para reemplazar el nodo y mantener la operación de acuerdo al DRP del oficio INMG-DDT-SBI-018-2018.

# Requerimientos de calidad

- El aprovisionamiento de los nodos no debe requerir intervención humana.

- La información necesaria para reestablecer el clúster debe estar en al menos 3 lugares.

# Documentación suplementaria

- [Inventario de equipos en el centro de datos del Instituto](https://docs.google.com/spreadsheets/d/1lcEfaBpBaxbph1b3tyBhJR4_lqlKWNwApUAsPJzhFuc/edit?usp=drive_web&ouid=111454019229199884053)

- [Manual de procedimientos del Instituto](http://www.inmegen.gob.mx/tema/cms_page_media/166/Manual_Procedimientos_Inmegen_2018_18oct18_NI.pdf)

- [MAAGTICSI](https://www.gob.mx/fnd/documentos/manual-administrativo-de-aplicacion-general-en-materia-de-tecnologias-de-la-informacion-y-comunicaciones "Manual Administrativo de Aplicación General en las materias de Tecnologías de la Información, Comunicaciones y Seguridad Informática")

- [Plan Anual de Trabajo del Instituto 2019](https://www.inmegen.gob.mx/media/filer_public/39/8f/398fd61f-bb9d-49a2-883a-08400ca2d277/inmegen_pat_2019_08abr2019_web.pdf)
