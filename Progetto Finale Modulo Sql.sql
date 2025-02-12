/*
ANALISI DELLA CLIENTELA DI UN DATABASE BANCARIO
L'obiettivo della presente analisi è la costruzione di una tabella denormalizzata che riepiloghi i dati forniti da
una banca sulla sua clientela, allo scopo di prendere decisioni data-driven. Ho creato 4 tab una per ogni tipo di indicatore 
per gestire più facilmente la costruzione della tab finale.
---------------------------------------------------------------------------------
/* CREAZIONE DI 4 TABELLE UNA PER OGNI GRUPPO DI INDICATORI */

/* INDICATORI DI BASE
La prima tabella ottenuta dai dati associa a ogni cliente la sua età.*/
CREATE TABLE banca.tmp_indicatore_base AS
SELECT id_cliente, TIMESTAMPDIFF(YEAR, data_nascita, CURDATE()) AS eta
FROM banca.cliente;

select * from banca.tmp_indicatore_base;
-------------------------------------------------------------------------------------------
/* INDICATORI SULLE TRANSAZIONI
La seconda tabella associa a ogni cliente il numero di transazioni e il totale degli importi transati sia in
entrata che in uscita. (2-5) */
/*TABELLA INDICATORI SULLE TRANSAZIONI */
-- Creazione della tabella 
CREATE TABLE banca.tmp_indicatori_transazioni (
    id_cliente int,
    n_transazioni_entrata int,
    n_transazioni_uscita int,
    tot_importo_entrata float,
    tot_importo_uscita float
);

-- Inserimento dei dati aggregati nella tabella 
INSERT INTO banca.tmp_indicatori_transazioni
SELECT 
    co.id_cliente,
    SUM(CASE WHEN tt.segno = "+" THEN 1 ELSE 0 END) AS n_transazioni_entrata,
    SUM(CASE WHEN tt.segno = "-" THEN 1 ELSE 0 END) AS n_transazioni_uscita,
    ROUND(SUM(CASE WHEN tt.segno = "+" THEN ABS(tr.importo) ELSE 0 END),2) AS tot_importo_entrata,
    ROUND(SUM(CASE WHEN tt.segno = "-" THEN ABS(tr.importo) ELSE 0 END),2) AS tot_importo_uscita
FROM banca.transazioni tr
LEFT JOIN banca.conto co
    ON tr.id_conto = co.id_conto
LEFT JOIN banca.tipo_transazione tt
    ON tr.id_tipo_trans = tt.id_tipo_transazione
GROUP BY co.id_cliente;

-- Visualizzazione dei dati inseriti
SELECT * FROM banca.tmp_indicatori_transazioni;
---------------------------------------------------------------------------------------------------------
 /*INDICATORI SUI CONTI
La terza tabella associa a ogni cliente il numero totale di conti posseduti e il numero di conti di ciascun tipo.*/
-- Creazione tabella 
create table banca.tmp_indicatori_conti (
	id_cliente int,
    n_conti int,
    n_conti_base int,
    n_conti_business int,
	n_conti_privati int,
    n_conti_famiglie int
);
INSERT INTO banca.tmp_indicatori_conti
SELECT 
    conto.id_cliente,
    COUNT(*) AS n_conti,
    SUM(CASE WHEN conto.id_tipo_conto = 0 THEN 1 ELSE 0 END) AS n_conti_base,
    SUM(CASE WHEN conto.id_tipo_conto = 1 THEN 1 ELSE 0 END) AS n_conti_business,
    SUM(CASE WHEN conto.id_tipo_conto = 2 THEN 1 ELSE 0 END) AS n_conti_privati,
    SUM(CASE WHEN conto.id_tipo_conto = 3 THEN 1 ELSE 0 END) AS n_conti_famiglie
FROM banca.conto conto
LEFT JOIN banca.tipo_conto tipo_conto
  ON conto.id_tipo_conto = tipo_conto.id_tipo_conto
GROUP BY conto.id_cliente;

SELECT * FROM banca.tmp_indicatori_conti;
-------------------------------------------------------------------------------------------------------------
/* INDICATORI SULLE TRANSAZIONI PER TIPO DI CONTO
La quarta e ultima tabella di indicatori associa a ogni cliente il numero di transazioni e gli importi transati
per tipo di conto posseduto, sia in entrata che in uscita */
create table banca.tmp_indicatori_transazioni_conti (
	id_cliente int,
    n_trans_entrata_base int,
    n_trans_entrata_business int,
    n_trans_entrata_privati int,
    n_trans_entrata_famiglie int,
    n_trans_uscita_base int,
    n_trans_uscita_business int,
    n_trans_uscita_privati int,
    n_trans_uscita_famiglie int,
    importo_entrata_base float,
    importo_entrata_business float,
    importo_entrata_privati float,
    importo_entrata_famiglie float,
    importo_uscita_base float,
    importo_uscita_business float,
    importo_uscita_privati float,
    importo_uscita_famiglie float
);
INSERT INTO banca.tmp_indicatori_transazioni_conti
SELECT 
    conto.id_cliente,
    SUM(CASE WHEN tipo_transazione.segno = "+" AND conto.id_tipo_conto = 0 THEN 1 ELSE 0 END) AS n_trans_entrata_base,
    SUM(CASE WHEN tipo_transazione.segno = "+" AND conto.id_tipo_conto = 1 THEN 1 ELSE 0 END) AS n_trans_entrata_business,
    SUM(CASE WHEN tipo_transazione.segno = "+" AND conto.id_tipo_conto = 2 THEN 1 ELSE 0 END) AS n_trans_entrata_privati,
    SUM(CASE WHEN tipo_transazione.segno = "+" AND conto.id_tipo_conto = 3 THEN 1 ELSE 0 END) AS n_trans_entrata_famiglie,
    SUM(CASE WHEN tipo_transazione.segno = "-" AND conto.id_tipo_conto = 0 THEN 1 ELSE 0 END) AS n_trans_uscita_base,
    SUM(CASE WHEN tipo_transazione.segno = "-" AND conto.id_tipo_conto = 1 THEN 1 ELSE 0 END) AS n_trans_uscita_business,
    SUM(CASE WHEN tipo_transazione.segno = "-" AND conto.id_tipo_conto = 2 THEN 1 ELSE 0 END) AS n_trans_uscita_privati,
    SUM(CASE WHEN tipo_transazione.segno = "-" AND conto.id_tipo_conto = 3 THEN 1 ELSE 0 END) AS n_trans_uscita_famiglie,
    SUM(CASE WHEN tipo_transazione.segno = "+" AND conto.id_tipo_conto = 0 THEN ABS(ROUND(transazioni.importo,2)) ELSE 0 END) AS importo_entrata_base,
    SUM(CASE WHEN tipo_transazione.segno = "+" AND conto.id_tipo_conto = 1 THEN ABS(ROUND(transazioni.importo,2)) ELSE 0 END) AS importo_entrata_business,
    SUM(CASE WHEN tipo_transazione.segno = "+" AND conto.id_tipo_conto = 2 THEN ABS(ROUND(transazioni.importo,2)) ELSE 0 END) AS importo_entrata_privati,
    SUM(CASE WHEN tipo_transazione.segno = "+" AND conto.id_tipo_conto = 3 THEN ABS(ROUND(transazioni.importo,2)) ELSE 0 END) AS importo_entrata_famiglie,
    SUM(CASE WHEN tipo_transazione.segno = "-" AND conto.id_tipo_conto = 0 THEN ABS(ROUND(transazioni.importo,2)) ELSE 0 END) AS importo_uscita_base,
    SUM(CASE WHEN tipo_transazione.segno = "-" AND conto.id_tipo_conto = 1 THEN ABS(ROUND(transazioni.importo,2)) ELSE 0 END) AS importo_uscita_business,
    SUM(CASE WHEN tipo_transazione.segno = "-" AND conto.id_tipo_conto = 2 THEN ABS(ROUND(transazioni.importo,2)) ELSE 0 END) AS importo_uscita_privati,
    SUM(CASE WHEN tipo_transazione.segno = "-" AND conto.id_tipo_conto = 3 THEN ABS(ROUND(transazioni.importo,2)) ELSE 0 END) AS importo_uscita_famiglie
FROM banca.transazioni transazioni
LEFT JOIN banca.conto conto
    ON transazioni.id_conto = conto.id_conto
LEFT JOIN banca.tipo_conto tipo_conto
    ON conto.id_tipo_conto = tipo_conto.id_tipo_conto
LEFT JOIN banca.tipo_transazione tipo_transazione
    ON transazioni.id_tipo_trans = tipo_transazione.id_tipo_transazione
GROUP BY conto.id_cliente;

SELECT * FROM banca.tmp_indicatori_transazioni_conti;

----------------------------------------------------------------------------------------------------------------------------------------
/* TABELLA FINALE DENORMALIZZATA
Le tabelle appena costruite sono state unite in una tabella riepilogativa che riassume i dati per ogni cliente.
Nel corso della costruzione della tabella sono emersi dati mancanti per diversi clienti(58) i valori
mancanti sono stati sostituiti da 0. */

create table banca.tabella_denormalizzata(
	id_cliente int,
    eta int,
    n_transazioni_entrata int,
    n_transazioni_uscita int,
    tot_importo_entrata float,
    tot_importo_uscita float,
    n_conti int,
    n_conti_base int,
    n_conti_business int,
    n_conti_privati int,
    n_conti_famiglie int,
    n_trans_entrata_base int,
    n_trans_entrata_business int,
    n_trans_entrata_privati int,
    n_trans_entrata_famiglie int,
    n_trans_uscita_base int,
    n_trans_uscita_business int,
    n_trans_uscita_privati int,
    n_trans_uscita_famiglie int,
    importo_entrata_base float,
    importo_entrata_business float,
    importo_entrata_privati float,
    importo_entrata_famiglie float,
    importo_uscita_base float,
    importo_uscita_business float,
    importo_uscita_privati float,
    importo_uscita_famiglie float
);

INSERT INTO banca.tabella_denormalizzata
SELECT 
    base.id_cliente,
    eta,
    CASE WHEN n_transazioni_entrata IS NULL THEN 0 ELSE n_transazioni_entrata END AS n_transazioni_entrata,
    CASE WHEN n_transazioni_uscita IS NULL THEN 0 ELSE n_transazioni_uscita END AS n_transazioni_uscita,
    CASE WHEN tot_importo_entrata IS NULL THEN 0 ELSE tot_importo_entrata END AS tot_importo_entrata,
    CASE WHEN tot_importo_uscita IS NULL THEN 0 ELSE tot_importo_uscita END AS tot_importo_uscita,
    CASE WHEN n_conti IS NULL THEN 0 ELSE n_conti END AS n_conti,
    CASE WHEN n_conti_base IS NULL THEN 0 ELSE n_conti_base END AS n_conti_base,
    CASE WHEN n_conti_business IS NULL THEN 0 ELSE n_conti_business END AS n_conti_business,
    CASE WHEN n_conti_privati IS NULL THEN 0 ELSE n_conti_privati END AS n_conti_privati,
    CASE WHEN n_conti_famiglie IS NULL THEN 0 ELSE n_conti_famiglie END AS n_conti_famiglie,
    CASE WHEN n_trans_entrata_base IS NULL THEN 0 ELSE n_trans_entrata_base END AS n_trans_entrata_base,
    CASE WHEN n_trans_entrata_business IS NULL THEN 0 ELSE n_trans_entrata_business END AS n_trans_entrata_business,
    CASE WHEN n_trans_entrata_privati IS NULL THEN 0 ELSE n_trans_entrata_privati END AS n_trans_entrata_privati,
    CASE WHEN n_trans_entrata_famiglie IS NULL THEN 0 ELSE n_trans_entrata_famiglie END AS n_trans_entrata_famiglie,
    CASE WHEN n_trans_uscita_base IS NULL THEN 0 ELSE n_trans_uscita_base END AS n_trans_uscita_base,
    CASE WHEN n_trans_uscita_business IS NULL THEN 0 ELSE n_trans_uscita_business END AS n_trans_uscita_business,
    CASE WHEN n_trans_uscita_privati IS NULL THEN 0 ELSE n_trans_uscita_privati END AS n_trans_uscita_privati,
    CASE WHEN n_trans_uscita_famiglie IS NULL THEN 0 ELSE n_trans_uscita_famiglie END AS n_trans_uscita_famiglie,
    CASE WHEN importo_entrata_base IS NULL THEN 0 ELSE importo_entrata_base END AS importo_entrata_base,
    CASE WHEN importo_entrata_business IS NULL THEN 0 ELSE importo_entrata_business END AS importo_entrata_business,
    CASE WHEN importo_entrata_privati IS NULL THEN 0 ELSE importo_entrata_privati END AS importo_entrata_privati,
    CASE WHEN importo_entrata_famiglie IS NULL THEN 0 ELSE importo_entrata_famiglie END AS importo_entrata_famiglie,
    CASE WHEN importo_uscita_base IS NULL THEN 0 ELSE importo_uscita_base END AS importo_uscita_base,
    CASE WHEN importo_uscita_business IS NULL THEN 0 ELSE importo_uscita_business END AS importo_uscita_business,
    CASE WHEN importo_uscita_privati IS NULL THEN 0 ELSE importo_uscita_privati END AS importo_uscita_privati,
    CASE WHEN importo_uscita_famiglie IS NULL THEN 0 ELSE importo_uscita_famiglie END AS importo_uscita_famiglie
FROM banca.tmp_indicatore_base AS base -- base
LEFT JOIN banca.tmp_indicatori_transazioni AS transazioni -- transazioni
    ON base.id_cliente = transazioni.id_cliente
LEFT JOIN banca.tmp_indicatori_conti AS conti -- conti
    ON base.id_cliente = conti.id_cliente
LEFT JOIN banca.tmp_indicatori_transazioni_conti AS transazioni_conti -- transazioni_conti
    ON base.id_cliente = transazioni_conti.id_cliente;

select * from banca.tabella_denormalizzata
