from django.db import models
from animales.models import Animal

# Create your models here.

class Vacuna (models.Model):
    nombre = models.CharField(max_length=45)

    def __str__(self):
        return self.nombre


class Dosi (models.Model):
    fecha = models.DateField()
    costo = models.DecimalField(max_digits=5,decimal_places=2)
    ndosis = models.IntegerField()
    vacuna = models.ForeignKey(Vacuna,on_delete=models.CASCADE,null=True,blank=True)
    animal = models.ForeignKey(Animal,on_delete=models.CASCADE,null=True,blank=True)
    def __str__(self):
        return str(self.fecha)+"-"+str(self.costo)

