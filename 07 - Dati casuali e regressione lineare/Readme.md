# Dati casuali e regressione lineare

## Contesto e Obiettivo del Progetto

In un’azienda data-driven, la capacità di generare e manipolare dati verosimili è essenziale per simulare scenari reali, supportare la formazione dei dipendenti e testare ipotesi di mercato. Questo progetto si concentra sulla creazione di un dataset realistico utilizzando un foglio di calcolo, con l'obiettivo di fornire uno strumento efficace per testare tecniche di analisi statistica e modelli di previsione.

## Descrizione del Progetto

L'azienda intende generare dati casuali ma significativi riguardanti la popolazione immaginaria di "Luggnagg". Il focus è su una distribuzione normale per l’età della popolazione, che simuli un campione di 250 individui. Il foglio di calcolo creato sarà strutturato in più schede (tab), ognuna con una funzione specifica che riflette i concetti di statistica appresi.

## Struttura del Foglio di Calcolo

Scheda 1: ***Parameters***
- **Obiettivo:** Fornire un'interfaccia per inserire i parametri della distribuzione normale (probabilità, media, deviazione standard).
- **Stile e Formattazione:** Intestazione con font "Comics Sans MS", dimensione 12pt, colore blu, bordi doppi. Celle dei valori riquadrate con bordo nero sottile.

Scheda 2: ***Data***
- **Obiettivo:** Visualizzare i dati generati per le età dei 250 individui e suddividere la popolazione in gruppi casuali.
- **Stile e Formattazione:** Colonna A per le età generate, colonna B per il gruppo di appartenenza generato casualmente. Intestazione con font "Comics Sans MS", 12pt, colore blu, bordi doppi.

Scheda 3: ***Sample***
- **Obiettivo:** Selezionare un sotto-campione dai dati generati in base al gruppo di appartenenza.
- **Stile e Formattazione:** Colonne A-C per dati di età, gruppo, e sotto-campione scelto. Utilizzo della funzione condizionale SE.

Scheda 4: ***Statistical Insight***
- **Obiettivo:** Analizzare statisticamente i dati del campione selezionato, calcolando valori chiave come deviazione standard, valore atteso, e intervallo di confidenza.
- **Stile e Formattazione:** Colonne per STDDEV, EXPECTED VALUE, COUNT, CONFIDENCE RATE, Estimation of p parameter, Confidence Interval. Cella di testo per spiegazione dettagliata.

Scheda 5: ***(Un)correlated Variables***
- **Obiettivo:** Testare la correlazione tra le età del campione e altre variabili casuali, come il numero di gatti posseduti o l'età del partner.
- **Stile e Formattazione:** Colonne per Sample data, Number of cats, Age of partner. Calcolo della correlazione e spiegazione dei risultati.

Scheda 6: ***Linear Regression***
- **Obiettivo:** Eseguire una regressione lineare tra l’età degli individui e il loro ordine di censimento.
- **Stile e Formattazione:** Colonne per Y (age), X (rank). Grafico scatterplot con regressione lineare per il partecipante 160.

## Valore Aziendale del Progetto

- Simulazione di scenari reali: I dati generati imitano una popolazione reale, fornendo un ambiente sicuro per testare   metodi di analisi statistica e machine learning.
- Miglioramento delle competenze: Il progetto serve come esercizio pratico per dipendenti e data analyst che             desiderano migliorare le proprie competenze in gestione e manipolazione dati.
- Decisioni basate sui dati: Gli insight derivati dall'analisi statistica del dataset consentono all'azienda di          formare dipendenti capaci di interpretare e utilizzare i dati per prendere decisioni aziendali basate su evidenze      numeriche.
