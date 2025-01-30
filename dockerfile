# Imagen base de Node.js
FROM node:16

# Establecer el directorio de trabajo dentro del contenedor
WORKDIR /app

# Crear un usuario no root
RUN useradd -m appuser

# Cambiar temporalmente al usuario root para instalar las dependencias
USER root

# Copiar el package.json y package-lock.json para instalar las dependencias
COPY package*.json ./

# Instalar las dependencias como root para evitar problemas de permisos
RUN npm install

# Copiar el resto de la aplicación
COPY . .

# Establecer permisos adecuados para el directorio de trabajo
RUN chown -R appuser:appuser /app

# Cambiar al usuario no root
USER appuser

# Construir la aplicación
RUN npm run build

# Exponer el puerto donde se ejecuta la API
EXPOSE 3000

# Comando para iniciar la aplicación
CMD ["npm", "run", "start"]
