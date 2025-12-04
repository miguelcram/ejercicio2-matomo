FROM matomo:latest

# Instalar una utilidad básica para depuración
RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*

# Añadir un archivo de prueba dentro del contenedor
RUN echo "Imagen personalizada de Miguel" > /var/www/html/custom-info.txt

