# Generated by Django 3.1.4 on 2021-09-16 00:23

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Propietario',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('documento', models.CharField(max_length=20)),
                ('nombres', models.CharField(max_length=30)),
                ('apellidos', models.CharField(max_length=30)),
                ('direccion', models.CharField(max_length=60)),
                ('telefono', models.CharField(max_length=20)),
                ('correo', models.EmailField(max_length=60)),
            ],
        ),
    ]
