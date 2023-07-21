from django.contrib import admin
from inventarios.models import Insumo,Categoria,Unidad,Control
# Register your models here.
#admin.site.register(Insumo)
#admin.site.register(Categoria)
#admin.site.register(Unidad)
admin.site.register(Control)

class InsumoAdmin (admin.ModelAdmin):
    list_display=('nombre','descripcion','stock','costo')
    list_filter=('nombre','descripcion')
    search_fields=('nombre','descripcion')
admin.site.register(Insumo,InsumoAdmin) 

class CategoriaAdmin (admin.ModelAdmin):
    list_display=('nombre',)
    list_filter=('nombre',)
    search_fields=('nombre',)
admin.site.register(Categoria,CategoriaAdmin) 

class UnidadAdmin (admin.ModelAdmin):
    list_display=('nombre','sigla')
    list_filter=('nombre','sigla')
    search_fields=('nombre','sigla')
admin.site.register(Unidad,UnidadAdmin) 
