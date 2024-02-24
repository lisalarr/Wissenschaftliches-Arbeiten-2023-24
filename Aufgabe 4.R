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


### Anzahl Geschwister und Ehefrauen
metrStat(titanic$SibSp)
# Die Spanne betraegt zwischen 0 und 8 Geschwistern bzw. Ehefrauen. Der Mittel-
# wert betraegt 0.5. Der Median ist sogar 0. Also haben sehr viele keine 
# Geschwister oder Ehefrauen auf dem Schiff. Da das 3. Quartil 1 betraegt, zeigt
# sich, dass mindestens 75% aller Menschen keine bis eine auf der Titanic haben. 
# Hier liegt eine staerkere rechtsschiefe als beim Alter vor. 
# Außerdem haben wir eine sehr spitze Verteilung der Daten.

extraUnivariate(titanic,"SibSp")
# Die Grafik stellt die Verteilung der Daten noch einmal deutlicher dar.


### Anzahl an Eltern und Kinder
metrStat(titanic$Parch)
# Diese sieht sehr aehnlich zu der Verteilung von der Anzahl der Geschwister und
# Ehefrauen aus. Die Spanne ist von 0 bis 6. Hingegen haben mindestens 75% 
# keine Eltern oder Kinder, die ebenso auf dem Schiff waren.

extraUnivariate(titanic,"Parch")
# Die Grafik stellt die Verteilung der Daten noch einmal deutlicher dar.

# --> Aus der deskriptiven Analyse der Anzahl an Geschwistern und Ehefrauen und der 
# Anzahl an Eltern und Kinder kann man darauf schließen, dass viele ohne Familie
# gereist sind.


### Ticketpreis
metrStat(titanic$Fare)
# Im Durchschnitt hat das Ticket 32.2$ gekostet. Dabei gibt es aber auch eine 
# große Abweichung (SD = 49.69). Dies zeigt sich auch in der Spanne von 0 bis
# 512.33$. Der Mittelwert und der Median ist mit 14.45$ sehr gering. Dies koennte 
# daran liegen, dass sehr viele Passagiere der 3. Klasse angehoert haben und diese 
# Tickets guenstiger waren. -> Analyse bei "bivariater Zusammenhang"
# Auch hier liegt eine rechtsschiefe, spitze Verteilung der Daten vor.

extraUnivariate(titanic,"Fare")
# Die Grafik stellt die Verteilung der Daten noch einmal deutlicher dar.
# Außerdem laesst die Grafik erkennen, dass sich bei den Ticketpreisen keine 
# klaren disjunkten Preisklassen aufdecken lassen, obwohl sich die Passagiere 
# durch den Kauf von Tickets fuer verschiedenen Klassen bereits fuer eine 
# Preiskategorie entschieden haben. Die Ticketpreise untescheiden sich somit 
# innerhalb derselben Klasse. -> weitere Analyse bei "bivariater Zusammenhang"


### Zustiegshafen
katStat(titanic$Embarked)
# Die meisten Passagiere sind in Southhampton zugestiegen (72.28%). Dazu im 
# Vergleich sind wenige in Cherbourg (18.86%) und Queenstown (8.64%) 
# zugestiegen. Bei zwei Passagieren ist der Zustiegshafen nicht bekannt. 


### Bord
katStat(titanic$Bord)
# Knapp ueber der Haelfte aller Passagiere haben auf der Backbordseite gewohnt (54%).
# 45% hatten eine Kabine auf der Steuerbordseite. Zwei Passagiere hatten ein
# Kabine auf beiden Seiten.
visualise(titanic$Bord)
# Die Grafik stellt den Unterschied noch einmal deutlicher dar.


### Deck
katStat(titanic$Deck)
# Die meisten Passagiere haben auf Deck C gelebt (28.92%), gefolgt von Deck B
# mit 23.04%. Die Decks D (16.18%) und E (15.69%) waren auch noch belebter.
# 7.35% Haben auf dem obersten Deck A gewohnt. Auf den untersten beiden jeweils
# unter 5% aller Passagiere. Es gab aber auch fuenf Passagiere (2.45%), die auf 
# mehreren Decks waren.
visualise(titanic$Deck)
# Die Grafik stellt den Unterschied noch einmal deutlicher dar.

########################## Bivariater Zusammenhang  ############################


# -->  Ticketpreis und Klasse der Reisenden

# Da Ticketpreis metrisch, aber Klasse nicht dichotom ist, kann die Funktion 
# "metrBiStat" nicht verwendet werden. Deswegen wurde hier gruppierte Boxplots 
# betrachtet, um den Unterschied in den Ticketpreisen zwischen den Klassen zu 
# analysieren. 

boxplot(titanic$Fare ~ titanic$Pclass)

# Wie erwartet, bezahlten Reisende der 1. Klasse deutlich mehr als die der 2. 
# und 3. Klasse. Die Spanne in der 2. und 3. Klasse ist aehnlich zueinander. 
# Bemerkenswert ist jedoch dass es einige Personen der 3. Klasse deutlich mehr 
# als die Mehrheit dieser Klasse bezahlten, was sich in den vielen Ausreißern 
# zeigt. Außerdem zeigt sich, dass in der ersten Klasse ein Ausreißer mit circa 
# 500$ gibt. Die naechsten Ausreißer liegen erst wieder zwischen 200 und 300$. 


# -->  Klasse der Reisenden und Deck

katBiStat(titanic$Pclass, titanic$Deck)

# Passagiere der ersten Klasse waren auf den Decks A bis E untergebracht, 
# Passagiere der 2. Klasse auf den Decks D bis F und der 3. Klasse auf E bis G. 
# Außerdem sind 33.33% der Passagiere der dritten KLasse auf mehreren Decks 
# verteilt. Dies trifft auch auf 0.57% der 1. Klasse zu.


# --> Analyse des Zusammenhanges zwischen Ueberlebensstatistiken und anderen
# moegliche Einflussfaktoren wie Geschlecht, Klasse des Reisenden, Alter 
# und Ticketpreis. 

### Geschlecht
katBiStat(titanic$Survived, titanic$Sex)

# Die Kreuztabelle zeigt, dass die meisten Verstorbenen maennlich (85,25%) und 
# die meisten der Ueberlebenden weiblich waren. 
# Diese Beobachtung wird durch die signifikante, positive mittlere Korrelation 
# (rho = 0,55, p <0,01) zwischen Geschlecht und ueberleben unterstuetzt.

# -> Das Geschlecht scheint in einem Zusammenhang mit dem Ueberleben zu stehen.

### Klasse der Reisenden
katBiStat(titanic$Survived, titanic$Pclass)

# Die Kreuztabellierung zeigt, dass die meisten der Verstorbenen der Klasse 3 
# angehoerten. Fast 40 % der Ueberlebenden gehoerten der Klasse 1 an. 
# Diese Beobachtung wurde durch die signifikante, positive Korrelation 
# (rho = 0,34, p < 0,01) zwischen Klasse und Ueberleben bestaetigt.

# -> Die Klasser der Reisenden scheint in einem Zusammenhang mit dem Ueberleben zu stehen.


### Alter der Reisenden
metrBiStat(titanic$Age, titanic$Survived)

# Das Mindestalter der Ueberlebenden liegt bei 1, das der Verstorbenen bei 0. 
# Das Hoechstalter der Ueberlebenden liegt bei 74, das der Verstorbenen bei 80. 
# Das Durchschnittsalter der Ueberlebenden (SD = 13,26) und der Verstorbenen 
# (SD = 13,27) betraegt 30 Jahre mit einer aehnlichen Streuung. 

# Der t-Test zeigt, dass es keinen signifikanten Altersunterschied zwischen den 
# beiden Gruppen von Reisenden gibt, was die deskriptiven Statistiken widerspiegelt.

# -> Das Alter der Reisenden scheint nicht in einem Zusammenhang zum Ueberleben
# zu stehen.


### Ticketpreis
metrBiStat(titanic$Fare, titanic$Survived)

# Der Durchschnittspreis der Verstorbenen liegt bei 22,12 $ und der 
# Durchschnittspreis der ueberlebenden bei 48,39 $. Die Preisspanne der ueberlebenden
# betraegt zwischen 0 bis 512.33$, die der Verstorbenen geht von 0 bis 263$.
# Die Preise der Ueberlebenden schwanken jedoch deutlich staerker (SD = 66,60$) 
# als die der Verstorbenen (SD = 31,39$). Daher ist es sinnvoller, den Median zu
# betrachten, der bei den Verstorbenen 10,5$ und bei den Ueberlebenden 26$ betraegt.

# -> Diese Beobachtung deutet darauf hin, dass die Ueberlebenden deutlich 
# mehr bezahlten als die Verstorbenen. Dies passt auch mit der Korrelation zwischen 
# Klasse und Ueberleben zusammen. 

# Der signifikante t-Test bestaetigt die deskriptive Beobachtung. 

# Innerhalb der Diskussion haben wir festgestellt, dass diese Anaylse inhaltlich 
# einwenig irrefuehrend ist, da die Anaylse den Anschein erweckt, als haetten 
# Passagiere fuer das Ueberleben mehr Geld gezahlt. Deshalb sollte diese Analyse
# eher nicht weiter Anwendung finden. Zudem spiegelt die die Analyse der 
# Verstorbenen/ Überlebenden in Bezug auf die Klasse der Reisenden ähnliche 
# interpretatorische Ergebnisse wider. 


### Ticketpreis und Alter im Zusammenhang mit Ueberleben

extraMultivariate(titanic, "Age", "Fare", "Survived")

# Das Histogramm zeigt, dass die Altersverteilung zwischen den Ueberlebenden und 
# den Verstorbenen gleich ist. Dies deckt sich mit der vorhherigen Analyse.
# Die lineare Regression zeigt, dass das Alter und der Ticketpreis in keinem 
# Zusammenhang zueinander steht.
# Der Boxplot bestaetigt die vorherige Analyse fuer das Alter.

extraMultivariate(titanic, "Fare", "Age", "Survived")

# Das Histogramm fuer Tickpreis bzw. der Boxplot fuer den Ticketpreis in 
# Zusammenhang mit dem Überleben bestaetigt ebenfalls die vorherige Analyse.

### Deck im Zusammenhang mit Ueberleben

katBiStat(titanic$Survived, titanic$Deck)

# Die meisten ueberlebenden befanden sich auf den Decks B-E. Die meisten 
# Verstorbenen waren auf Deck C (35.29%). Auf den Decks A,B,D und E sind auch 
# ueber 10% verstorben. Kein klarer Zusammenhang zwischen Ueberleben und Decks 
# ist zu beobachten. Das koennte daran liegen, dass die Klassen ueber viele Decks
# verteilt sind. 

