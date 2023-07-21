from haciendas.models import Lote
from django.db import models

# Create your models here.

class Raza (models.Model):
    nombre = models.CharField(max_length=45)

    def __str__(self):
        return self.nombre


class Especie (models.Model):
    nombre = models.CharField(max_length=45)
    descripcion = models.CharField(max_length=50)
    
    def __str__(self):
        return self.nombre+"-"+self.descripcion


class Animal (models.Model):
    nombre = models.CharField(max_length=45)
    observacion = models.CharField(max_length=50)
    pesoactual=models.DecimalField(max_digits=5,decimal_places=2)
    fecha = models.DateField()
    costo=models.DecimalField(max_digits=15,decimal_places=2)
    lotes = models.ForeignKey(Lote,on_delete=models.CASCADE,null=True,blank=True)
    raza = models.ForeignKey(Raza,on_delete=models.CASCADE,null=True,blank=True)
    especie = models.ForeignKey(Especie,on_delete=models.CASCADE,null=True,blank=True)
    
    def __str__(self):
        return self.nombre+"-"+self.observacion       

class Peso (models.Model):
    fecha = models.DateField()
    peso = models.DecimalField(max_digits=5,decimal_places=2)
    animal = models.ForeignKey(Animal,on_delete=models.CASCADE,null=True,blank=True)

    def __str__(self):
        return str(self.fecha)+"-"+str(self.peso)
