# Wissenschaftliches Arbeiten 2023/24
Abgabe von GitHub Gruppe 12

Der zugrundeliegende Datensatz ist eine csv.Datei mit Informationen zu den Passagieren auf der Titanic.  
Die Daten wurden zur Analye vorverarbeitet, so dass der zur Auswertung verwendete Datensatz die folgenden Variablen enthält: 

- Survived (Factor)  
Hat den Untergang der Titanic überlebt: ja = 1, nein = 0
- Pclass (Ord.factor)  
Klasse des Reisenden: 1 > 2 > 3 
- Sex (Factor)  
Geschlecht: 0 = male, 1 = female
- Age (num)        
Altern in Jahren beim Untergang: mittels mean imputiert
- SibSp (int)        
Anzahl an Geschwistern und Ehefrauen an Bord
- Parch (int)        
Anzahl an Eltern und Kinder an Bord
- Fare (num)  
Ticketpreis
- Embarked (Factor)     
Zustiegshafen: Cherbourg = C, Queenstown = Q, Southampton = S
- Title (chr)        
Anrede
- Bord (num)        
Lage: Backbord = 0; Steuerbord = 1; beides = 2
- Deck (int)        
Buchstabe der Kabinennumer: mehrere Decks = 0, A = 1, B = 2, C = 3, ...
