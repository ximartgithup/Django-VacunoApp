from django.db import models
from animales.models import Animal

# Create your models here.
class Unidad (models.Model):
    nombre = models.CharField(max_length=45)
    sigla = models.CharField(max_length=15)
    def __str__(self):
        return self.nombre+"-"+self.sigla

class Categoria (models.Model):
    nombre = models.CharField(max_length=45)
    def __str__(self):
        return self.nombre
   

class Insumo (models.Model):
    nombre = models.CharField(max_length=45)
    descripcion = models.CharField(max_length=50)
    stock = models.DecimalField(max_digits=10,decimal_places=2) #10 entero, 2 decimal
    costo = models.DecimalField(max_digits=15,decimal_places=2) #10 entero, 2 decimal
    categoria = models.ForeignKey(Categoria,on_delete=models.CASCADE,null=True,blank=True)
    unidades = models.ForeignKey(Unidad,on_delete=models.CASCADE,null=True,blank=True)

    def __str__(self):
        return self.nombre+"-"+self.descripcion
    

class Control (models.Model):
    fecha = models.DateField()
    cantidad = models.IntegerField(default=1)
    costo = models.DecimalField(max_digits=15,decimal_places=2) #10 entero, 2 decimal
    observacion = models.CharField(max_length=55)
    animales = models.ForeignKey(Animal,on_delete=models.CASCADE,null=True,blank=True)
    insumo = models.ForeignKey(Insumo,on_delete=models.CASCADE,null=True,blank=True)
    
    def __str__(self):
        return str(self.fecha)+"-"+self.observacion