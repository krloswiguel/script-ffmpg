#!/bin/bash

URL_DEL_STREAM="srt://DIRECCION_DEL_SERVIDOR:PUERTO/STREAM"

while true; do
    # Verificar la conectividad a Internet
    if ping -c 1 google.com > /dev/null 2>&1; then
        # Reproducir el stream usando ffplay en modo pantalla completa y con bucle continuo
        ffplay -hide_banner -fs -i "$URL_DEL_STREAM" -loop 0
    else
        # Si la conexión a Internet se pierde, espera unos segundos y vuelve a intentar
        echo "Conexión a Internet perdida. Reintentando en 10 segundos..."
        sleep 10
    fi
done
