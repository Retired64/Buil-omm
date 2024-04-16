copia y pega este comando en termux, recuerda tener tu `baserom.us.z64` que pesa 8MB su formato es `.z64` originalmente esto no debes cambiarlo tu..... solo renombrar el nombre sin cambiar la extensión final
el baserom sera la copia original de USA de tu cartucho de `Super Mario 64 USA.z64`
y deberas usar esta aplicación

Termux: https://f-droid.org/repo/com.termux_118.apk
para obtener tu juego Odysey

- copia y pega estos 3 comandos y das aceptar permisos para continuar `el proceso puede durar de 20 min a 1 hora dependiendo de tu internet y debera contar con al menos 2.5 Gb disponibles...
- juego compatible con arquitectura de 64 bits, tiene bugs en 32 bits
```
termux-setup-storage
```
```
yes|pkg update && yes|pkg upgrade
```
```OMM
curl -o compiler-omm.sh https://raw.githubusercontent.com/Retired64/Buil-omm/main/compiler-omm.sh && chmod +x compiler-omm.sh && ./compiler-omm.sh
```
