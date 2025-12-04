FROM matomo:latest

RUN apt-get update && apt-get install -y \
    libpng-dev && \
    docker-php-ext-configure gd --with-jpeg=/usr/include --with-freetype=/usr/include && \
    docker-php-ext-install gd && \
    rm -rf /var/lib/apt/lists/*

LABEL org.opencontainers.image.title="Matomo Custom" \
      org.opencontainers.image.vendor="Miguel" \
      org.opencontainers.image.version="1.0" \
      org.opencontainers.image.description="Matomo personalizado con extensiones PHP y metadatos para ver en 'Información del sistema'"
