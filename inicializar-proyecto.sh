#!/bin/bash

# Variables de colores para los textos
CROJO='\033[0;31m' # Color Rojo 
CVERDE='\033[0;32m' # Color Verde 
NOCOLOR='\033[0m' # Quitamos el color
if [ -n "$1" ]; then # Comprobamos que se le pasa el nombre del poruyecto
	if [ -f $(pwd)/webappdjango/manage.py ];
	then
		echo "${CROJO}El prouyecto ya fue inicializado${NOCOLOR}"
		exit 
	fi

	echo "${CVERDE} Inicializamos el proyecto $1 ${NOCOLOR}"
	mv env .env  # Renombramos el fichero env a .env para ir colocando las variables mas esenciales  
	docker-compose -f dev.yml run web django-admin startproject $1  .
	CMARIADB=$(openssl rand -base64 16)
	
	echo "${CVERDE} Creamos la estructura para desarollo y produccion $1 ${NOCOLOR}"
	mkdir webappdjango/$1/settings  # Creamos la carpeta de settings
	mv webappdjango/$1/settings.py webappdjango/$1/settings/base.py # Movemos el settings a la carpeta settings y le cambiamos el nombre
	echo "${CVERDE} Movemos dev.py y pro.py al settings del proyecto ${NOCOLOR}"
	cp dev.py webappdjango/$1/settings/dev.py  # Esto tendra que ser cambiado a un mv cuando este terminado   
	cp pro.py webappdjango/$1/settings/pro.py  # Esto tendra que ser cambiado a un mv cuando este terminado   
	echo "${CVERDE} Añadimos las variables de entorno minimas al .env${NOCOLOR}"
	echo "DJANGO_SETTINGS_MODULE=${1}.settings.dev" >> .env
	echo "MYSQL_ROOT_PASSWORD=cambiame" >> .env  # Clave root de mariadb
	echo "MARIADB_DATABASE=${1}" >> .env  # Nombre de la db. Por defecto le pone la del prouecto
	echo "MARIADB_USER=${1}" >> .env  # Por defecto usa el nombre de prouecto como usuario
	echo "MARIADB_PASSWORD=${CMARIADB}" >> .env # Recomendable cambiar clave db usuario   
else

	echo "${CROJO} Es obligatorio que le pases el nombre del proyecto ${NOCOLOR}. Ejemplo ./inicializar-proyecto.sh tunombreporoyecto"

fi