from django.db import models
from personas.models import Propietario
# Create your models here.


class Hacienda (models.Model):
    nombre = models.CharField(max_length=45)
    descripcion = models.CharField(max_length=50)
    hectareas = models.DecimalField(max_digits=5,decimal_places=1) #10 entero, 2 decimal

    def __str__(self):
        return self.nombre+"-"+self.descripcion

class Lote (models.Model):
    nombre = models.CharField(max_length=45)
    descripcion = models.CharField(max_length=50)
    fecha = models.DateField()
    hacienda = models.ForeignKey(Hacienda,on_delete=models.CASCADE,null=True,blank=True)
    propietario = models.ForeignKey(Propietario,on_delete=models.CASCADE,null=True,blank=True)
    
    def __str__(self):
        return self.nombre+"-"+self.descripcion        