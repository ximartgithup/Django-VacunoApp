from animales.models import Especie, Raza,Peso,Animal
from django.contrib import admin

# Register your models here.
class RazaAdmin (admin.ModelAdmin):
    list_display=('nombre',)
    list_filter=('nombre',)
    search_fields=('nombre',)
admin.site.register(Raza,RazaAdmin) 

class EspecieAdmin (admin.ModelAdmin):
    list_display=('nombre','descripcion')
    list_filter=('nombre','descripcion')
    search_fields=('nombre','descripcion')
admin.site.register(Especie,EspecieAdmin) 

class PesoAdmin (admin.ModelAdmin):
    list_display=('fecha','peso')
    list_filter=('fecha','peso')
    search_fields=('fecha','peso')
admin.site.register(Peso,PesoAdmin) 

class AnimalAdmin (admin.ModelAdmin):
    list_display=('nombre','observacion','pesoactual','fecha','costo','raza','lotes','especie')
    list_filter=('nombre','observacion')
    search_fields=('nombre','observacion')
admin.site.register(Animal,AnimalAdmin) 