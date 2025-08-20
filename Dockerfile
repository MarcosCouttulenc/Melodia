FROM python:3.10-slim

# Establecer el directorio de trabajo
WORKDIR /app

# Copiar primero requirements.txt
COPY requirements.txt /app/

# Instalar las dependencias
RUN pip install --no-cache-dir -r requirements.txt

# Copiar el resto del código fuente
COPY backend /app

# Comando para correr la app
CMD ["python", "app.py"]