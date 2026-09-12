from django.shortcuts import render

from .models import Utente, Corso, Iscrizione, Allievo, Insegnante, Amministratore, Genitore, HaFiglio, Lezione, Saggio, PartecipaSaggio

from django.shortcuts import redirect

# Create your views here.
def home(request):
    return render(request, 'gestione/home.html')

def elenco_corsi(request):
    query = request.GET.get('q', '')
    if query:
        corsi = Corso.objects.filter(nome__icontains=query) | Corso.objects.filter(stile__icontains=query)
    else:
        corsi = Corso.objects.all()
    return render(request, 'gestione/corsi.html', {'corsi': corsi, 'query': query})

def dettaglio_corso(request, corso_id):
    if request.session.get('ruolo') not in ('amministratore', 'insegnante'):
        return redirect('login')
    corso = Corso.objects.get(id_corso=corso_id)
    iscrizioni = Iscrizione.objects.filter(corso=corso)
    ruolo = request.session.get('ruolo')
    return render(request, 'gestione/dettaglio_corso.html', {'corso': corso, 'iscrizioni': iscrizioni, 'ruolo': ruolo})

def elenco_allievi(request):
    if request.session.get('ruolo') != 'amministratore':
        return redirect('login')
    allievi = Allievo.objects.all()
    lista_allievi = []
    for allievo in allievi:
        genitore = None
        ha_figlio = HaFiglio.objects.filter(allievo=allievo).first()
        if ha_figlio:
            genitore = ha_figlio.genitore
        lista_allievi.append({'allievo': allievo, 'genitore': genitore})
    return render(request, 'gestione/allievi.html', {'lista_allievi': lista_allievi})

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

def login_view(request):
    errore = None
    if request.method == 'POST':
        email = request.POST.get('email')
        password = request.POST.get('password')
        try:
            utente = Utente.objects.get(email=email, password=password)
            request.session['id_utente'] = utente.id_utente
            request.session['nome_utente'] = f"{utente.nome} {utente.cognome}"

            if Allievo.objects.filter(utente=utente).exists():
                request.session['ruolo'] = 'allievo'
                return redirect('area_allievo')
            elif Insegnante.objects.filter(utente=utente).exists():
                request.session['ruolo'] = 'insegnante'
                return redirect('area_insegnante')
            elif Amministratore.objects.filter(utente=utente).exists():
                request.session['ruolo'] = 'amministratore'
                return redirect('area_amministratore')
            elif Genitore.objects.filter(utente=utente).exists():
                request.session['ruolo'] = 'genitore'
                return redirect('area_genitore')
        except Utente.DoesNotExist:
            errore = "Email o password non corretti."
    return render(request, 'gestione/login.html', {'errore': errore})


def logout_view(request):
    request.session.flush()
    return redirect('home')

def area_allievo(request):
    if request.session.get('ruolo') != 'allievo':
        return redirect('login')
    allievo = Allievo.objects.get(utente__id_utente=request.session['id_utente'])
    iscrizioni = Iscrizione.objects.filter(allievo=allievo)
    partecipazioni_saggi = PartecipaSaggio.objects.filter(allievo=allievo)

    tutti_i_saggi = Saggio.objects.all()
    saggi_disponibili = []
    for saggio in tutti_i_saggi:
        gia_iscritto = PartecipaSaggio.objects.filter(allievo=allievo, saggio=saggio).exists()
        if not gia_iscritto:
            saggi_disponibili.append(saggio)

    return render(request, 'gestione/area_allievo.html', {
        'allievo': allievo,
        'iscrizioni': iscrizioni,
        'partecipazioni_saggi': partecipazioni_saggi,
        'saggi_disponibili': saggi_disponibili
    })

def area_insegnante(request):
    if request.session.get('ruolo') != 'insegnante':
        return redirect('login')
    insegnante = Insegnante.objects.get(utente__id_utente=request.session['id_utente'])
    corsi = Corso.objects.filter(insegnante=insegnante)
    return render(request, 'gestione/area_insegnante.html', {'insegnante': insegnante, 'corsi': corsi})


def area_amministratore(request):
    if request.session.get('ruolo') != 'amministratore':
        return redirect('login')
    amministratore = Amministratore.objects.get(utente__id_utente=request.session['id_utente'])
    corsi = Corso.objects.all()
    saggi = Saggio.objects.filter(amministratore=amministratore)
    return render(request, 'gestione/area_amministratore.html', {'amministratore': amministratore, 'corsi': corsi, 'saggi': saggi})

def area_genitore(request):
    if request.session.get('ruolo') != 'genitore':
        return redirect('login')
    genitore = Genitore.objects.get(utente__id_utente=request.session['id_utente'])
    figli = HaFiglio.objects.filter(genitore=genitore)
    figli_con_corsi = []
    for figlio in figli:
        iscrizioni = Iscrizione.objects.filter(allievo=figlio.allievo)
        figli_con_corsi.append({'allievo': figlio.allievo, 'iscrizioni': iscrizioni})
    return render(request, 'gestione/area_genitore.html', {'genitore': genitore, 'figli_con_corsi': figli_con_corsi})

def orari(request):
    lezioni = Lezione.objects.all().order_by('data', 'ora_inizio')
    return render(request, 'gestione/orari.html', {'lezioni': lezioni})

def elenco_saggi(request):
    saggi = Saggio.objects.all().order_by('data')
    return render(request, 'gestione/saggi.html', {'saggi': saggi})

def dettaglio_saggio(request, saggio_id):
    if request.session.get('ruolo') != 'amministratore':
        return redirect('login')
    saggio = Saggio.objects.get(id_saggio=saggio_id)
    partecipazioni = PartecipaSaggio.objects.filter(saggio=saggio)
    return render(request, 'gestione/dettaglio_saggio.html', {'saggio': saggio, 'partecipazioni': partecipazioni})

def iscrivi_saggio(request, saggio_id):
    if request.session.get('ruolo') != 'allievo':
        return redirect('login')
    allievo = Allievo.objects.get(utente__id_utente=request.session['id_utente'])
    saggio = Saggio.objects.get(id_saggio=saggio_id)
    if not PartecipaSaggio.objects.filter(allievo=allievo, saggio=saggio).exists():
        nuova_partecipazione = PartecipaSaggio(allievo=allievo, saggio=saggio)
        nuova_partecipazione.save(force_insert=True)
    return redirect('area_allievo')