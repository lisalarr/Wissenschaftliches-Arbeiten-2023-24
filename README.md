# Wissenschaftliches Arbeiten 2023/24
Abgabe von GitHub Gruppe 12

Die Bearbeitung der Aufgaben wurde wie folgt eingeteilt:
- Aufgabe 1: Antonia Köhr und Lisa Larrass
- Aufgabe 4: Sam Fujarski und Inken Veips

Der zugrundeliegende Datensatz "titanic" ist eine csv-Datei mit Informationen zu den Passagieren auf der Titanic.
Die Daten wurden zur Analyse vorbereitet, so dass der verwendete Datensatz "titanic_new" die folgenden Variablen enthält: 

- Survived (Factor)  
Hat den Untergang der Titanic überlebt: ja = 1, nein = 0
- Pclass (Ord.factor)  
Klasse des Reisenden: 1 > 2 > 3 
- Sex (Factor)  
Geschlecht: male = 0, female = 1
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
- Bord (Factor)        
Lage: Backbord = 0; Steuerbord = 1; beides = 2
- Deck (Factor)        
Buchstabe der Kabinennumer: mehrere Decks = 0, A = 1, B = 2, C = 3, ...
