from django.contrib import admin

# Register your models here.
from .models import Utente, Allievo, Insegnante, Amministratore, Genitore, Corso, Lezione, Iscrizione, Presenza, Saggio, PartecipaSaggio, HaFiglio

admin.site.register(Utente)
admin.site.register(Allievo)
admin.site.register(Insegnante)
admin.site.register(Amministratore)
admin.site.register(Genitore)
admin.site.register(Corso)
admin.site.register(Lezione)
admin.site.register(Iscrizione)
admin.site.register(Presenza)
admin.site.register(Saggio)
admin.site.register(PartecipaSaggio)
admin.site.register(HaFiglio)