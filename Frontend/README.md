Este Dockerfile incluye dos etapas:

Etapa de Construcción: Utiliza Node.js para instalar dependencias y construir la aplicación.
Etapa de Producción: Copia los archivos construidos en una imagen de Nginx y configura el servidor web.

# docker build --build-arg mode=production -t berluseden/helloworld:latest .

