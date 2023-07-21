from django.contrib import admin
from haciendas.models import Lote,Hacienda
# Register your models here.
class LoteAdmin (admin.ModelAdmin):
    list_display=('nombre','descripcion','fecha','propietario','hacienda')
    list_filter=('nombre','descripcion')
    search_fields=('nombre','descripcion')
admin.site.register(Lote,LoteAdmin) 

class HaciendaAdmin (admin.ModelAdmin):
    list_display=('nombre','descripcion','hectareas')
    list_filter=('nombre','descripcion')
    search_fields=('nombre','descripcion')
admin.site.register(Hacienda,HaciendaAdmin) 