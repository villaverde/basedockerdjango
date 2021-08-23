from .base import *

INSTALLED_APPS += [
        'django_extensions',
        'debug_toolbar',
    ]

MIDDLEWARE += [
    'debug_toolbar.middleware.DebugToolbarMiddleware',
]

STATICFILES_DIRS = [
    BASE_DIR + '/../static',
]


def show_toolbar(request):
    return True


DEBUG_TOOLBAR_CONFIG = {
    'SHOW_TOOLBAR_CALLBACK': show_toolbar,
}