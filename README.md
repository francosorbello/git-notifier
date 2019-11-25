# Git notifier

Script de powershell que genera una notificación de escritorio cuando se actualiza un repositorio de git.

## Instrucciones de uso

### Añadir repos

Para añadir repositorios, corra el archivo **git-notifier-gui**, seleccione la carpeta done esta el repo y clickee "Add".
También puede copiar la dirección en el cuadro de texto.

### Ejecutar automaticamente
1. Abra el Task Scheduler
2. Seleccione "Create Basic Task"
3. En la pestaña Trigger, seleccione "When I log on"
4. En Action seleccione "Start a program"
5. Escriba "Powershell.exe" y en "Add arguments" ingrese la dirección del directorio donde tiene guardado el script **git-notifier**
6. Una vez creado, haga doble click en la Task y vaya a la pestaña "Triggers".
7. Clickee "Edit". Luego en las opciones avanzadas Active "Repeat task every: 30 minutes | for a duration of: Indefinitely"
