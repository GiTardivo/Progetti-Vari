Analisi dei Piloti del Mondiale di Formula 1
Descrizione del Progetto

F1 Analytics, specializzata nell'analisi delle prestazioni dei piloti e dei team di Formula 1, ha intrapreso un progetto per analizzare i risultati del Campionato Mondiale di Formula 1 della stagione 2008. Utilizzando i dati contenuti nel file formula1_data.csv, l'obiettivo è implementare funzionalità per analizzare i punti, le vittorie e i podi sia a livello individuale che di costruttori.
Dataset

Il dataset formula1_data.csv contiene le seguenti colonne:

    Driver: Nome del pilota.
    Team: Nome del costruttore per il quale il pilota gareggia.
    Race: Città in cui si è svolto il Gran Premio.
    Country: Paese in cui si è svolto il Gran Premio.
    Position: Numero da 0 a 8 che indica l'ordine di arrivo del pilota.

Sistema di punteggio:

    1° posto: 10 punti
    2° posto: 8 punti
    3° posto: 6 punti
    4° posto: 5 punti
    5° posto: 4 punti
    6° posto: 3 punti
    7° posto: 2 punti
    8° posto: 1 punto
    9° posto o oltre: 0 punti

Obiettivi del Progetto

    Analisi delle Performance Individuali dei Piloti

Implementare una funzione che riceve in input il nome di un pilota e restituisce: Totale dei punti accumulati durante il campionato. Numero di vittorie (quante volte è arrivato primo). Numero di podi (quante volte è arrivato tra i primi tre classificati).

    Creazione della Classifica Finale dei Piloti

Generare un dizionario con i nomi dei piloti come chiavi e il loro punteggio totale come valori. Utilizzare il dizionario per creare una classifica generale dei piloti e salvare i risultati in un file di testo (Drivers_Standings_2008.txt).

    Classifica dei Costruttori

Creare un dizionario con i nomi dei team/costruttori come chiavi e il loro punteggio totale come valori. Il punteggio di ciascun team è la somma dei punti ottenuti dai piloti che hanno gareggiato per quel costruttore.
Contributi
Questo progetto fornisce una visione approfondita delle performance dei piloti e dei team nella stagione 2008 di Formula 1, contribuendo a un'analisi dettagliata delle dinamiche del campionato.
