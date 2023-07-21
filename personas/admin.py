from django.contrib import admin
from personas.models import Propietario 
# Register your models here.
#admin.site.register(Propietario)

class PropietarioAdmin (admin.ModelAdmin):
    list_display=('documento','nombres','apellidos','direccion','telefono','correo')
    list_filter=('apellidos','nombres',)
    search_fields=('nombres','documento','apellidos',)
admin.site.register(Propietario,PropietarioAdmin)  
