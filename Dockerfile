# Utilizamos la imagen de Python como base para nuestro contenedor
FROM python:3.8-slim

# Establecemos el directorio de trabajo en /app
WORKDIR /app

# Copiamos el archivo Pipfile y Pipfile.lock al directorio de trabajo
COPY Pipfile* ./

# Instalamos pipenv y utilizamos el archivo Pipfile para instalar las dependencias del proyecto
RUN pip install pipenv importlib-metadata && pipenv install --system

# Copiamos el código de nuestro proyecto al directorio de trabajo
COPY . .

# Exponemos el puerto 5000 para recibir peticiones HTTP
EXPOSE 5000

# Ejecutamos el comando flask run para iniciar el servidor Flask
CMD ["flask", "run", "--host=0.0.0.0"]

