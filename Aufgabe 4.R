# ************************************************
# *          Wissenschaftliches Arbeiten         *
# *              GitHub: Gruppe 12               *
# *          Aufgabe 4 (Datenanalyse)            *
# ************************************************


# Funktionen der 2. Aufgabe laden
source("Aufgabe2_1.R")

# Bereinigten Datensatz laden
load("titanic_new.RData")


######################## Deskriptive Analyse der Daten #########################

### Ueberleben
katStat(titanic$Survived)
# Die meisten Passgiere haben das Unglueck nicht ueberlebt (61.62%).
visualise(titanic$Survived)
# Die Grafik stellt den Unterschied noch einmal deutlicher dar.


### Klasse der Reisenden
katStat(titanic$Pclass)
# Die meisten Passagiere gehoerten der dritten Klasse an. Dies sind circa 55.11%
# aller Passagiere, also mehr ueber die Haelfte aller. Die restlichen Passagiere
# teilen sich auf die erste und zweite Klasse auf, wobei die erste Klasse mit 
# 24.24% an der Gesamtanzahl ein wenig staerker vertreten ist, als die zweite
# Klasse mit 20.65%.
visualise(titanic$Pclass)
# Die Grafik stellt den Unterschied noch einmal deutlicher dar.


### Geschlecht
katStat(titanic$Sex)
# Zu 64.76% waren Maenner auf der Titanic. Der Frauenanteil war mit 35.24% eher 
# gering. 
visualise(titanic$Sex)
# Die Grafik stellt den Unterschied noch einmal deutlicher dar.


### Alter
metrStat(titanic$Age)
# Im Mittel sind die Menschen circa 30 Jahre alt gewesen. Wobei die Variable 
# auch eine große Abweichung aufweist (SD = 13.26). Dies zeigt sich auch darin, 
# dass die Spanne 0 bis 80 Jahre betraegt. 
# Der Median stimmt mit dem Mittelwert ueberein.
# Die Variable weist keine fehlende Werte, aber mit einer Schiefe von 0.37
# weisen die Daten eine leichte rechtsschiefe auf.
# Mit einer Woelbung von 3.71 liegt eine spitze Verteilung der Daten vor, also 
# haben viele ein Alter im Bereich um den Mittelwert rum. Dies zeigt sich auch 
# darin, dass 50% aller Personen zwischen 22 und 36 Jahre alt sind.

extraUnivariate(titanic,"Age")
# Die Grafik stellt die Verteilung der Daten noch einmal deutlicher dar.


### Titel
katStat(titanic$Title)
# Die meisten Passagiere haben als Titel den Mister (58.02%). Dies passt zu der
# Analyse, dass die Mehrheit der Passagiere maennlich ist. Darauf folgt mit 20.76%
# der Titel Miss (bzw. die Gruppe zusammengefuegt unter Ms). Mrs ist mit 14.14%
# auch noch mehr vertreten. Alle anderen Titel sind nur mit unter 5% vertreten.


