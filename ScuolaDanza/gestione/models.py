from django.db import models

# Create your models here.
class Utente(models.Model):
    id_utente = models.AutoField(primary_key=True)
    nome = models.CharField(max_length=50)
    cognome = models.CharField(max_length=50)
    email = models.EmailField(max_length=100, unique=True)
    password = models.CharField(max_length=255)
    data_nascita = models.DateField(null=True, blank=True)
    telefono = models.CharField(max_length=20, null=True, blank=True)

    class Meta:
        db_table = 'utente'
        managed = False

    def __str__(self):
        return f"{self.nome} {self.cognome}"

class Allievo(models.Model):
    utente = models.OneToOneField(Utente, on_delete=models.CASCADE, primary_key=True, db_column='id_utente')
    livello_danza = models.CharField(max_length=30, null=True, blank=True)
    data_iscrizione_scuola = models.DateField(null=True, blank=True)

    class Meta:
        db_table = 'allievo'
        managed = False

    def __str__(self):
        return str(self.utente)


class Insegnante(models.Model):
    utente = models.OneToOneField(Utente, on_delete=models.CASCADE, primary_key=True, db_column='id_utente')
    specializzazione = models.CharField(max_length=50, null=True, blank=True)
    anni_esperienza = models.IntegerField(null=True, blank=True)
    biografia = models.TextField(null=True, blank=True)

    class Meta:
        db_table = 'insegnante'
        managed = False

    def __str__(self):
        return str(self.utente)


class Amministratore(models.Model):
    utente = models.OneToOneField(Utente, on_delete=models.CASCADE, primary_key=True, db_column='id_utente')
    biografia = models.TextField(null=True, blank=True)

    class Meta:
        db_table = 'amministratore'
        managed = False

    def __str__(self):
        return str(self.utente)


class Genitore(models.Model):
    utente = models.OneToOneField(Utente, on_delete=models.CASCADE, primary_key=True, db_column='id_utente')

    class Meta:
        db_table = 'genitore'
        managed = False

    def __str__(self):
        return str(self.utente)


class Corso(models.Model):
    id_corso = models.AutoField(primary_key=True)
    nome = models.CharField(max_length=50)
    stile = models.CharField(max_length=50, null=True, blank=True)
    livello = models.CharField(max_length=30, null=True, blank=True)
    prezzo = models.DecimalField(max_digits=6, decimal_places=2, null=True, blank=True)
    insegnante = models.ForeignKey(Insegnante, on_delete=models.SET_NULL, null=True, blank=True, db_column='id_insegnante')

    class Meta:
        db_table = 'corso'
        managed = False

    def __str__(self):
        return self.nome


class Lezione(models.Model):
    id_lezione = models.AutoField(primary_key=True)
    data = models.DateField()
    ora_inizio = models.TimeField()
    ora_fine = models.TimeField()
    corso = models.ForeignKey(Corso, on_delete=models.CASCADE, db_column='id_corso')

    class Meta:
        db_table = 'lezione'
        managed = False


class Iscrizione(models.Model):
    allievo = models.ForeignKey(Allievo, on_delete=models.CASCADE, db_column='id_allievo', primary_key=True)
    corso = models.ForeignKey(Corso, on_delete=models.CASCADE, db_column='id_corso')
    data_iscrizione = models.DateField(null=True, blank=True)
    quota_pagata = models.DecimalField(max_digits=6, decimal_places=2, null=True, blank=True)
    stato = models.CharField(max_length=20, null=True, blank=True)

    class Meta:
        db_table = 'iscrizione'
        managed = False
        unique_together = (('allievo', 'corso'),)


class Presenza(models.Model):
    allievo = models.ForeignKey(Allievo, on_delete=models.CASCADE, db_column='id_allievo', primary_key=True)
    lezione = models.ForeignKey(Lezione, on_delete=models.CASCADE, db_column='id_lezione')
    presente = models.BooleanField(null=True, blank=True)

    class Meta:
        db_table = 'presenza'
        managed = False
        unique_together = (('allievo', 'lezione'),)


class Saggio(models.Model):
    id_saggio = models.AutoField(primary_key=True)
    titolo = models.CharField(max_length=100)
    data = models.DateField(null=True, blank=True)
    luogo = models.CharField(max_length=100, null=True, blank=True)
    amministratore = models.ForeignKey(Amministratore, on_delete=models.SET_NULL, null=True, blank=True, db_column='id_amministratore')

    class Meta:
        db_table = 'saggio'
        managed = False

    def __str__(self):
        return self.titolo


class PartecipaSaggio(models.Model):
    allievo = models.ForeignKey(Allievo, on_delete=models.CASCADE, db_column='id_allievo', primary_key=True)
    saggio = models.ForeignKey(Saggio, on_delete=models.CASCADE, db_column='id_saggio')

    class Meta:
        db_table = 'partecipa_saggio'
        managed = False
        unique_together = (('allievo', 'saggio'),)


class HaFiglio(models.Model):
    genitore = models.ForeignKey(Genitore, on_delete=models.CASCADE, db_column='id_genitore', primary_key=True)
    allievo = models.ForeignKey(Allievo, on_delete=models.CASCADE, db_column='id_allievo')

    class Meta:
        db_table = 'ha_figlio'
        managed = False
        unique_together = (('genitore', 'allievo'),)