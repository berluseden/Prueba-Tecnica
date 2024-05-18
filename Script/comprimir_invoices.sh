#!/bin/bash

# Directorio donde se guardan los archivos temporales
DIRECTORIO="/ruta/al/directorio"

cd "$DIRECTORIO"

archivos=$(ls invoice_*.txt 2>/dev/null)

# Verificar si hay archivos en el directorio
if [ -z "$archivos" ]; then
  echo "No se encontraron archivos para comprimir."
  exit 0
fi

declare -A meses

for archivo in $archivos; 
do
  mes=$(echo $archivo | cut -d'_' -f2 | cut -c1-6)
  
  # Agregar el archivo al array del mes correspondiente
  meses[$mes]+="$archivo "
done

for mes in "${!meses[@]}"; 
do
  tar -czf "invoices_$mes.tar.gz" ${meses[$mes]}
  
  # Eliminar los archivos originales
  rm -f ${meses[$mes]}
done

echo "Archivos comprimidos y txt eliminados."


# Hacer el archivo ejecutable:  chmod +x comprimir_invoices.sh
#Ejecutar el script: ./comprimir_invoices.sh


