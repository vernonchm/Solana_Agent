# Dockerfile para AceAutonomousCreator
FROM python:3.10-slim

# Instalar dependencias del sistema necesarias para compilar librerías de Rust/C
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Crear y establecer directorio de trabajo
WORKDIR /app

# Copiar requerimientos e instalar dependencias de Python
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copiar el resto del código del bot
COPY . .

# Comando por defecto para correr el agente
CMD ["python", "agent.py"]
