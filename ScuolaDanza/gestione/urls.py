from django.urls import path
from . import views

urlpatterns = [
    path('', views.home, name='home'),
    path('corsi/', views.elenco_corsi, name='elenco_corsi'),
    path('corsi/<int:corso_id>/', views.dettaglio_corso, name='dettaglio_corso'),
    path('allievi/', views.elenco_allievi, name='elenco_allievi'),
    path('team/', views.team, name='team'),
    path('login/', views.login_view, name='login'),
    path('logout/', views.logout_view, name='logout'),
    path('area-allievo/', views.area_allievo, name='area_allievo'),
    path('area-insegnante/', views.area_insegnante, name='area_insegnante'),
    path('area-amministratore/', views.area_amministratore, name='area_amministratore'),
    path('area-genitore/', views.area_genitore, name='area_genitore'),
    path('orari/', views.orari, name='orari'),
    path('saggi/', views.elenco_saggi, name='elenco_saggi'),
    path('saggi/<int:saggio_id>/', views.dettaglio_saggio, name='dettaglio_saggio'),
]

