#!/bin/bash

URL_DEL_STREAM="srt://DIRECCION_DEL_SERVIDOR:PUERTO/STREAM"

# Función para verificar la conectividad a Internet
verificar_conexion() {
    ping -c 1 google.com > /dev/null 2>&1
    return $?
}

while true; do
    # Verificar la conectividad a Internet
    verificar_conexion
    CONEXION=$?

    if [ $CONEXION -eq 0 ]; then
        # Si hay conexión a Internet, intentar reproducir el flujo SRT
        ffmpeg -hide_banner -reconnect 1 -reconnect_streamed 1 -reconnect_delay_max 5 -i "$URL_DEL_STREAM" -vf "fullscreen" -nostats -loglevel 0 -nostdin -autoexit -f null -
    else
        # Si no hay conexión a Internet, esperar y volver a intentar
        echo "Conexión a Internet perdida. Reintentando en 10 segundos..."
        sleep 10
    fi
done
