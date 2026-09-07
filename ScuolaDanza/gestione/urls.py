from django.urls import path
from . import views

urlpatterns = [
    path('', views.home, name='home'),
    path('corsi/', views.elenco_corsi, name='elenco_corsi'),
    path('corsi/<int:corso_id>/', views.dettaglio_corso, name='dettaglio_corso'),
]