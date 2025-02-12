### Analisi di un Database Bancario

Il progetto è stato realizzato al termine del corso di SQL nel Master di Data Analyst di ProfessionAI ed è stato revisionato durante la prima settimana di febbraio 2025. 
Lo scopo del progetto era costruire una tabella denormalizzata che riepilogasse i dati contenuti in un database bancario fittizio.

### Specifiche

Il progetto si è sviluppato in più fasi:

Esplorazione del database:
 L'analisi è iniziata con l'esplorazione delle tabelle di un database bancario, comprendendo la struttura dei dati relativi alla clientela, ai conti e alle transazioni.

Costruzione di indicatori:
 Sono state create quattro tabelle temporanee, ognuna contenente un gruppo di indicatori:

Indicatori di Base: contiene l'età dei clienti.

Indicatori sulle Transazioni: aggrega il numero di transazioni e gli importi totali transati (entrata e uscita) per cliente.

Indicatori sui Conti: riepiloga il numero totale di conti e il numero di conti per tipologia (Base, Business, Privati, Famiglie).

Indicatori sulle Transazioni per Tipologia di Conto: aggrega il numero di transazioni e gli importi transati per ogni tipo di conto, sia per le transazioni in entrata che per quelle in uscita.

Tabella Denormalizzata:
Infine, i dati aggregati dalle tabelle temporanee sono stati uniti tramite opportuni join per creare una tabella denormalizzata finale che contiene tutti gli indicatori rilevanti per l’analisi della clientela.

## File del Progetto

La cartella del progetto contiene i seguenti file:

- db_bancario.sql:
 Contiene lo script per la creazione del database e l'inserimento dei dati.

- analisi_database_bancario.sql:
  Contiene le query effettuate per l’analisi del database e la creazione degli indicatori.


## Tecnologie Utilizzate

  📶   SQL: per la scrittura delle query.
  🐋   MySQL: come sistema di gestione del database per importare i dati ed eseguire le query.

## Considerazioni Finali

Il progetto ha permesso di:

Comprendere la struttura di un database bancario.
Sviluppare tecniche di aggregazione e denormalizzazione dei dati.
Creare una tabella finale che supporta l'analisi data-driven della clientela, evidenziando anche i clienti inattivi e attivi.
