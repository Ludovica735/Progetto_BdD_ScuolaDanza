from django.shortcuts import render

from .models import Corso, Iscrizione, Allievo

# Create your views here.
def home(request):
    return render(request, 'gestione/home.html')

def elenco_corsi(request):
    corsi = Corso.objects.all()
    return render(request, 'gestione/corsi.html', {'corsi': corsi})

def dettaglio_corso(request, corso_id):
    corso = Corso.objects.get(id_corso=corso_id)
    iscrizioni = Iscrizione.objects.filter(corso=corso)  #prendi tutte le iscrizioni che appartengono a questo corso
    return render(request, 'gestione/dettaglio_corso.html', {'corso': corso, 'iscrizioni': iscrizioni})

def elenco_allievi(request):
    allievi = Allievo.objects.all()
    return render(request, 'gestione/allievi.html', {'allievi': allievi})