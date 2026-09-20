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

---

## **Installazione**

Per eseguire l'applicazione è necessario:

1. **Avere Python installato** nel proprio ambiente.
   > Nota: si consiglia Python 3.12.x — versioni più recenti (es. 3.14) possono presentare incompatibilità con Django 4.2.
3. **Avere accesso a un server MySQL/MariaDB**, preferibilmente con phpMyAdmin.
4. **Clonare il progetto** nella propria directory locale.

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
        'PASSWORD': '',
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
<img width="1917" height="907" alt="Home" src="https://github.com/user-attachments/assets/a6f9a7aa-6160-4f94-90c5-327528acda60" />

**Homepage:**
La homepage offre l'accesso alle principali funzionalità della scuola, con la possibilità di consultare i corsi disponibili, il team della scuola, gli orari delle lezioni e gli eventuali eventi e/o saggi programmati. Inoltre, è possibile accedere all'area riservata effettuando il Login, tramite email e password.

**Area Riservata:**
L'applicazione prevede accessi differenziati in base al ruolo dell'utente:

1. **Login Amministratore**
   - Gestione di corsi, insegnanti e iscrizioni.
   - Organizzazione dei saggi.
<img width="1917" height="902" alt="Login_Amministratore" src="https://github.com/user-attachments/assets/ade03e3c-a00e-449d-bffc-f8980fe502c1" />

2. **Login Insegnante**
   - Gestione delle lezioni e delle presenze degli allievi.
<img width="1908" height="900" alt="Login_Insegnante" src="https://github.com/user-attachments/assets/450f86a9-fa97-4505-86f3-3dd9e4d6f4dc" />

3. **Login Genitore**
   - Visualizzazione dei dati e delle presenze dei propri figli.
   - Iscrizione ai corsi e ai saggi.
<img width="1911" height="902" alt="Login_Genitore" src="https://github.com/user-attachments/assets/21135b2b-74f0-456e-947b-a0de8db7a146" />

4. **Login Allievo**
   - Consultazione del proprio percorso: corsi, presenze e saggi.
<img width="1916" height="898" alt="Login_Allievo" src="https://github.com/user-attachments/assets/b9d46d06-181f-41cf-85ed-688401b99ddf" />

---

## **Licenza**

Questo progetto è stato realizzato e distribuito a scopo didattico con licenza [MIT](LICENSE).
Puoi usarlo, modificarlo e distribuirlo liberamente, a patto che venga mantenuta la nota di copyright.
