from django.shortcuts import  render
from haciendas.models import Lote,Hacienda
from personas.models import Propietario
from jinja2 import Template
# para la autenticación o proteger las vistas que requieran login
from django.contrib.auth.decorators import login_required
# Create your views here.
#======== para pdf=============================
from io import BytesIO
from xhtml2pdf import pisa 
from django.template.loader import get_template
from django.http.response import HttpResponse
#==================================================
@login_required(login_url='/account/login/')
def index(request):
    return render(request,'home.html')

@login_required(login_url='/account/login/')
def listaLotes(request):
    lotes=Lote.objects.all() #select * from lotes
    data={'lotes':lotes}
    return render(request,'lotes/index.html',data)
# si viene por post recibe y guarda y muestra el form
#si viene por get solo muestra el formulario
#@login_required(login_url='/account/login/')
def nuevoLote(request):
     propietarios=Propietario.objects.all()
     haciendas = Hacienda.objects.all()
     data={'propietarios':propietarios,'haciendas':haciendas}
     if request.method=='POST':
         #Recibe y guarda
        lote=Lote() # crea un obj Lote
        lote.nombre=request.POST.get('nombre')
        lote.descripcion=request.POST.get('descripcion')
        lote.fecha=request.POST.get('fecha')
        lote.propietario = Propietario() #crea obj
        lote.hacienda = Hacienda() #crea el obj
        lote.hacienda.id=request.POST.get('hacienda')
        lote.propietario.id=request.POST.get('propietario')
        #Guarda en la BD
        lote.save()
    
        data['msg']='Registro guardado con éxito!'#adiciona una clave y valor al diccionario
     return render(request,'lotes/add.html',data)

# Metdodo eliminar lote---------------    
def deleteLote(request,id):
    estado=Lote.objects.filter(id=id).delete()
    lotes=Lote.objects.all() #select * from lotes
    data={'lotes':lotes}
    print('Estado = ',estado)
    if estado:
        data['msg']='Lote eliminado '
    return render(request,'lotes/index.html',data)    

#---Actualizar lote
def editLote(request,id):
     lotes = Lote.objects.filter(id=id).first() #seleccione el lote del id
     template = Template("{{date.strftime('%Y-%m-%d')}}")
     formated_date = template.render(date=lotes.fecha)
     lotes.fecha = formated_date
     propietarios=Propietario.objects.all()
     haciendas = Hacienda.objects.all()
     data={'propietarios':propietarios,'haciendas':haciendas,'lotes':lotes}
     if request.method=='POST':
        
         #Recibe y guarda
         id=request.POST.get('idlote')
         lote=Lote.objects.filter(id=id).first()
         lote.nombre=request.POST.get('nombre')
         lote.descripcion=request.POST.get('descripcion')
         lote.fecha=request.POST.get('fecha')
         lote.propietario = Propietario() #crea obj
         lote.hacienda = Hacienda() #crea el obj
         lote.hacienda.id=request.POST.get('hacienda')
         lote.propietario.id=request.POST.get('propietario')
        #Guarda en la BD
         lote.save()
         data['msg']='Registro actualizado con éxito!'#adiciona una clave y valor al diccionario
     return render(request,'lotes/edit.html',data)



#----------- pdf*----------
def render_to_pdf(template_src, context_dict={}):
    template = get_template(template_src)
    html  = template.render(context_dict)
    result = BytesIO()
    pdf = pisa.pisaDocument(BytesIO(html.encode("ISO-8859-1")), result)
    if not pdf.err:
        return HttpResponse(result.getvalue(), content_type='application/pdf')
    return None     

def listado_pdf(request):
     lotes = Lote.objects.all()
     data={'lotes':lotes}
     pdf = render_to_pdf('lotes/lotes_pdf.html', data)
     return HttpResponse(pdf, content_type='application/pdf')

