# 🏎️ Analisi dei Piloti del Mondiale di Formula 1 (2008)

## 📌 Descrizione del Progetto
**F1 Analytics** ha intrapreso un progetto per analizzare i risultati del **Campionato Mondiale di Formula 1 2008**.  
Utilizzando i dati contenuti nel file `formula1_data.csv`, l’obiettivo è implementare funzionalità per studiare **punti, vittorie e podi**, sia a livello individuale che di **costruttori**.

---

## 📂 Dataset
Il file `formula1_data.csv` contiene le seguenti colonne:

- **Driver**: Nome del pilota  
- **Team**: Nome del costruttore per il quale il pilota gareggia  
- **Race**: Città in cui si è svolto il Gran Premio  
- **Country**: Paese in cui si è svolto il Gran Premio  
- **Position**: Numero da `0` a `8` che indica l’ordine di arrivo del pilota  

### 🏆 Sistema di Punteggio
| Posizione | Punti |
|-----------|-------|
| 1°        | 10    |
| 2°        | 8     |
| 3°        | 6     |
| 4°        | 5     |
| 5°        | 4     |
| 6°        | 3     |
| 7°        | 2     |
| 8°        | 1     |
| 9°+       | 0     |

---

## 🎯 Obiettivi del Progetto

### 1️⃣ Analisi delle Performance Individuali
Creare una funzione che, dato un pilota in input, restituisce:
- Totale dei **punti accumulati**  
- Numero di **vittorie** (1° posto)  
- Numero di **podi** (posizioni 1–3)  

---

### 2️⃣ Classifica Finale dei Piloti
- Generare un dizionario con i piloti come chiavi e il punteggio totale come valore  
- Ordinare i risultati per creare la **classifica generale**  
- Salvare i risultati in un file di testo: `Drivers_Standings_2008.txt`  

---

### 3️⃣ Classifica dei Costruttori
- Creare un dizionario con i costruttori come chiavi e il loro punteggio totale come valore  
- Il punteggio di ciascun team è dato dalla **somma dei punti ottenuti dai piloti** che hanno gareggiato per quel costruttore  

---

## 📊 Contributi
Questo progetto fornisce una visione approfondita delle performance di piloti e team nella stagione **2008 di Formula 1**, permettendo un’analisi dettagliata delle dinamiche del campionato.

---

## 🚀 Tecnologie Utilizzate
- Python 3.x  
- Pandas  
- Matplotlib  

---


