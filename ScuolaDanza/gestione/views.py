from django.shortcuts import render

from .models import Corso, Iscrizione, Allievo, Insegnante, Amministratore, HaFiglio

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

def team(request):
    insegnanti = Insegnante.objects.all()
    amministratori = Amministratore.objects.all()
    return render(request, 'gestione/team.html', {'insegnanti': insegnanti, 'amministratori': amministratori})

def elenco_allievi(request):
    allievi = Allievo.objects.all()
    lista_allievi = []
    for allievo in allievi:
        genitore = None
        ha_figlio = HaFiglio.objects.filter(allievo=allievo).first()
        if ha_figlio:
            genitore = ha_figlio.genitore
        lista_allievi.append({'allievo': allievo, 'genitore': genitore})
    return render(request, 'gestione/allievi.html', {'lista_allievi': lista_allievi})