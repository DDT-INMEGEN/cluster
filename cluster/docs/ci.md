Para proporcionar integracion continua a este sistema se requiere:

[✓] Flujo de trabajo
===============================

1.  Generar una rama por cada actividad que se trabaja,
    la rama debe referir al sistema de gestión que lo originó.

2.  La característica debe tener documentación y es lo primero que se agrega.

3.  Cada característica nueva debe tener una prueba unitaria.

4.  Cada commit en la rama ejecuta las pruebas unitarias.

5.  Se hace una revisión del código.

6.  Cuando todo está terminado se agrega a la línea maestra (auto-conf)
    y se replica a todo el clúster.

[Pasos de integración contínua](https://codeship.com/continuous-integration-essentials )
===============================

[✓] Mantener un repositorio de código

[ ] Automatizar la construcción del código

[ ] Hacer que la construcción del código se verifique sola

[ ] Commits diarios a base por todo el equipo.

[ ] Cada commit debe construirse.

[ ] Las construcciones deben ser rápidas.

[ ] Clonar el entorno de producción y probar allí.

[ ] Hacer fácil generar entregables

[ ] Todos los miembros del equipo pueden ver los resultados de tu construcción.

[ ] Automatizar el despliege de código
