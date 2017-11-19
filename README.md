# Base de django dockerizado
lo primero que se tiene que hacer es crear un archivo .env vacío en el que se añadirá todas la variables de entorno que necesites para el proyecto

### Como crear un proyecto django
Para creaer un proyecto ejecuta lo siguiente
`docker-compose -f dev.yml run web django-admin startproject nombreprojecto .`

### Crear una aplicaion django
`docker-compose -f dev.yml run web python3 manage.py startapp nombreapp`


