# Imagen base de Node.js
FROM node:16

# Establecer el directorio de trabajo
WORKDIR /app

# Crear usuario no root
RUN useradd -m appuser

# Establecer el cache de npm en un directorio controlado
ENV NPM_CONFIG_CACHE=/app/.npm

# Copiar archivos y dar permisos adecuados
COPY package*.json ./
RUN mkdir -p /app/.npm && chown -R appuser:appuser /app/.npm

# Instalar dependencias
RUN npm install

# Copiar el resto de la app
COPY . .

# Construir la app
RUN npm run build

# Cambiar al usuario no root
USER appuser

# Exponer el puerto
EXPOSE 3000

# Comando para iniciar la aplicación
CMD ["npm", "run", "start:prod"]
