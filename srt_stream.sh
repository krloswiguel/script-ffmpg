#!/bin/bash

# URL del servidor SRT
URL_DEL_STREAM="srt://38.91.100.244:5124"

# Función para verificar la conexión a Internet
verificar_conexion() {
    ping -c 1 google.com > /dev/null 2>&1
    return $?
}

# Bucle para reproducir el flujo SRT de forma continua
while true; do
    # Verificar la conexión a Internet
    if verificar_conexion; then
        # Reproducir el flujo SRT en pantalla completa con MPV
        mpv --fs "$URL_DEL_STREAM"
    else
        echo "No hay conexión a Internet. Reiniciando el script en 10 segundos..."
        sleep 10
    fi
done
