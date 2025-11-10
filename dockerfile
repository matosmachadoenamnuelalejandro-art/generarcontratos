FROM python:3.9-slim

WORKDIR /app

# Copiar requirements primero para mejor cache
COPY requirements.txt .

# Instalar dependencias del sistema necesarias
RUN apt-get update && apt-get install -y \
    gcc \
    && rm -rf /var/lib/apt/lists/*

# Instalar dependencias de Python
RUN pip install --no-cache-dir -r requirements.txt

# Copiar toda la aplicación
COPY . .

# Crear directorio para documentos
RUN mkdir -p documentos_generados

# Exponer puerto
EXPOSE 5000

# Comando para ejecutar
CMD ["python", "app.py"]
