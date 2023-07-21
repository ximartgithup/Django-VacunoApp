from django.contrib import admin
from vacunas.models import Vacuna,Dosi
# Register your models here.
class DosiAdmin (admin.ModelAdmin):
    list_display=('fecha','costo','ndosis','vacuna')
    list_filter=('fecha','costo')
    search_fields=('fecha','costo')
admin.site.register(Dosi,DosiAdmin) 

class VacunaAdmin (admin.ModelAdmin):
    list_display=('nombre',)
    list_filter=('nombre',)
    search_fields=('nombre',)
admin.site.register(Vacuna,VacunaAdmin) 