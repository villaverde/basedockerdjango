# Base de django dockerizado
lo primero que se tiene que hacer es crear un archivo .env vacío en el que se añadirá todas la variables de entorno que necesites para el proyecto

### Como crear un proyecto django
Para creaer un proyecto ejecuta lo siguiente
`sh  inicializar-proyecto.sh .`

### Configurar el proyecto
Edita el archivo webappdjango/nombre_de_tu_proyecto/settins/base.py

busca la variable siguiente:
```python
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': BASE_DIR / 'db.sqlite3',
    }
}
```
y sustitullela por esta otra
```python
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': os.environ['MARIADB_DATABASE'],
        'USER': os.environ['MARIADB_USER'],
        'PASSWORD': os.environ['MARIADB_PASSWORD'],
        'HOST': os.environ['DB_HOST'],
        'PORT': os.environ['DB_PORT'],
    }
}
```
