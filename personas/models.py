from django.db import models

# Create your models here.
class Propietario (models.Model):
    documento = models.CharField(max_length=20)
    nombres = models.CharField(max_length=30)
    apellidos = models.CharField(max_length=30)
    direccion = models.CharField(max_length=60)
    telefono = models.CharField(max_length=20)
    correo = models.EmailField(max_length=60)
    def __str__(self):
        return self.documento+"-"+self.apellidos+" "+self.nombres