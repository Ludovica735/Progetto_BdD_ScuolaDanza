# **Sistema Informativo – "Etoile" Scuola di Danza**

Questo progetto nasce con l'obiettivo di progettare e implementare un sistema informativo per la gestione di una **scuola di danza**.
L'intento è quello di **sostituire le procedure cartacee** con un'applicazione web che supporti allievi, insegnanti, genitori e amministrazione nella gestione di corsi, iscrizioni, presenze ed eventi, migliorando organizzazione e accessibilità ai dati.

---

## **Indice**

1. [Obiettivo del Sistema](#obiettivo-del-sistema)
2. [Tecnologie Utilizzate](#tecnologie-utilizzate)
3. [Installazione](#installazione)
4. [Configurazione del Database](#configurazione-del-database)
5. [Utilizzo](#utilizzo)
6. [Licenza](#licenza)

---

## **Obiettivo del Sistema**

La piattaforma è progettata per rispondere alle esigenze operative di una scuola di danza, offrendo funzionalità quali:

- **Gestione degli allievi**, con iscrizioni ai corsi e storico delle presenze alle lezioni.
- **Gestione dei corsi e delle lezioni**, tenute dagli insegnanti.
- **Gestione dei genitori**, collegati agli allievi di cui sono responsabili.
- **Organizzazione dei saggi**, con relativa partecipazione degli allievi.
- **Interfaccia differenziata** per allievi, genitori, insegnanti e amministratori, ciascuno con accesso a funzionalità specifiche.

L'architettura garantisce un controllo degli accessi differenziato in base al ruolo dell'utente.

---

## **Tecnologie Utilizzate**

### **Backend**

- **Python** – Linguaggio di programmazione principale.
- **Django** – Framework web per la logica server-side.
- **mysqlclient** – Libreria per collegare Django a MySQL/MariaDB.

### **Database**

- **MySQL / MariaDB** – Database relazionale esterno (`scuola_danza`), gestito tramite phpMyAdmin per facilitare l'inserimento e la gestione dei dati. Le tabelle principali sono: `allievo`, `amministratore`, `corso`, `genitore`, `ha_figlio`, `insegnante`, `iscrizione`, `lezione`, `partecipa_saggio`, `presenza`, `saggio`, `utente`.

### **Frontend**

- **HTML / CSS** – Utilizzati per l'interfaccia utente.

### **Modellazione Dati**

- **Modello E/R** alla base della struttura del database.
> Nota: nel repository il file del modello E/R è salvato come `.$Modello_ER_scuola_danza.png.bkp` — ti consiglio di rinominarlo in `Modello_ER_scuola_danza.png` così può essere visualizzato direttamente qui nel README.

---

## **Installazione**

Per eseguire l'applicazione è necessario:

1. **Avere Python installato** nel proprio ambiente.
2. **Avere accesso a un server MySQL/MariaDB**, preferibilmente con phpMyAdmin.
3. **Clonare il progetto** nella propria directory locale.

```
git clone https://github.com/Ludovica735/Progetto_BdD_ScuolaDanza.git
cd Progetto_BdD_ScuolaDanza
```

4. **Creare e attivare un ambiente virtuale (consigliato)**

```
python -m venv venv
```

Linux/macOS

```
source venv/bin/activate
```

Windows (cmd)

```
venv\Scripts\activate.bat
```

Windows (PowerShell)

```
.\venv\Scripts\Activate.ps1
```

5. **Installare le dipendenze**

```
pip install django mysqlclient
```

---

## **Configurazione del Database**

1. **Importare il database da dump SQL**
Nel repository è presente il file `scuola_danza.sql` con la struttura completa del database.

Via phpMyAdmin:
- Accedi a phpMyAdmin
- Crea un nuovo database chiamato `scuola_danza`
- Clicca su Importa e carica il file `scuola_danza.sql`

2. **Configurazione del Database su Django**
All'interno del file `settings.py` del progetto Django, configura la connessione al database MySQL/MariaDB:

```
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'scuola_danza',
        'USER': 'nome_utente',
        'PASSWORD': ' ',
        'HOST': 'localhost',
        'PORT': '3306',
    }
}
```

---

## **Utilizzo**

Dopo la configurazione, eseguire i seguenti comandi da terminale per applicare le migrazioni:

```
python manage.py makemigrations
python manage.py migrate
```

Una volta completato, avviare il server locale con:

```
python manage.py runserver
```

L'applicazione sarà accessibile all'indirizzo: <http://localhost:8000>.

**Homepage:**
La homepage offre l'accesso alle principali funzionalità della scuola, con la possibilità di consultare i corsi disponibili e accedere all'area riservata.

**Area Riservata:**
L'applicazione prevede accessi differenziati in base al ruolo dell'utente:

1. **Login Amministratore**
   - Gestione di corsi, insegnanti e iscrizioni.
   - Organizzazione dei saggi.

2. **Login Insegnante**
   - Gestione delle lezioni e delle presenze degli allievi.

3. **Login Genitore**
   - Visualizzazione dei dati e delle presenze dei propri figli.
   - Iscrizione ai corsi e ai saggi.

4. **Login Allievo**
   - Consultazione del proprio percorso: corsi, presenze e saggi.

---

## **Licenza**

Questo progetto è stato realizzato e distribuito a scopo didattico con licenza [MIT](LICENSE).
Puoi usarlo, modificarlo e distribuirlo liberamente, a patto che venga mantenuta la nota di copyright.
