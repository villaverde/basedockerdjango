from .base import *
import raven

INSTALLED_APPS += [
    #'raven.contrib.django.raven_compat', #Descomentar si se empieza a usar sentry
    ]

MIDDLEWARE += [

]

STATICFILES_DIRS = [
    BASE_DIR + '/../static',
]

#Dejo esto para un posible futuro activar en produccion sentry y logear errores
"""
RAVEN_CONFIG = {
    'dsn': 'http://6f40516dd9544291945bd938cbc1f1c0:5f4aba5ab28449b1b16f59e8a28ca911@sentry.grupodixital.es/11',
    # If you are using git, you can also automatically configure the
    # release based on the git info.
}
"""