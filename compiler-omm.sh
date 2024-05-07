#!/bin/bash
echo -e "\e[32mIniciando COMPILACIÓN....\e[0m"
sleep 3
# Actualizar e instalar paquetes necesarios
yes|pkg update && yes|pkg upgrade -y
pkg remove libglvnd
pkg install git wget make python getconf zip apksigner clang binutils libglvnd-dev aapt which -y

# Clonar el repositorio
git clone --recursive https://github.com/robertkirkman/sm64ex-omm.git

# Buscar el archivo baserom.us.z64 recursivamente en /sdcard/ excluyendo la carpeta Android
baserom_path=$(find /sdcard/ -not -path "*/Android/*" -name "baserom.us.z64" 2>/dev/null)

if [ -z "$baserom_path" ]; then
    # Si no se encuentra el archivo, mostrar un mensaje y salir del script
    echo -e "\e[31mNo se ha encontrado el archivo del juego necesario. Por favor, obtén tu juego original y renómbralo a baserom.us.z64\e[0m"
    exit 1
else
    # Si se encuentra el archivo, copiarlo al directorio del repositorio
    cp "$baserom_path" ~/sm64ex-omm/baserom.us.z64
    echo -e "\e[32mArchivo baserom.us.z64 encontrado y copiado exitosamente.\e[0m"

    # Compilar el proyecto
    cd sm64ex-omm/ && make

    # Verificar si se compiló exitosamente el APK
    if [ -f ~/sm64ex-omm/build/us_pc/sm64.us.f3dex2e.apk ]; then
        # Copiar el APK compilado a la carpeta de almacenamiento externo
        cp ~/sm64ex-omm/build/us_pc/sm64.us.f3dex2e.apk /storage/emulated/0/
        echo -e "\e[32mAPK compilado copiado a /storage/emulated/0/ exitosamente.\e[0m"
    else
        echo -e "\e[31mError: No se pudo compilar el APK correctamente.\e[0m"
    fi
fi

# Salir del script
exit 0
