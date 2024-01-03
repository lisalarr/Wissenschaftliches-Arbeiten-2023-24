# Wissenschaftliches Arbeiten 2023/24
Abgabe von GitHub Gruppe 12

Der zugrundeliegende Datensatz ist eine csv.Datei mit Informationen zu den Passagieren auf der Titanic. 
Die Daten wurden zur Analye vorverarbeitet, so dass der zur Auswertung verwendete Datensatz wie folgt aussieht:  

- (Factor)     Survived     (Hat den Untergang der Titanic überlebt: ja = 1, nein = 0)
- (Ord.factor) Pclass       (Klasse des Reisenden: 1 > 2 > 3)
- (Factor)     Sex          (Geschlecht: 0 = male, 1 = female) 
- (num)        Age          (Altern in Jahren beim Untergang: mittels mean imputiert)
- (int)        SibSp        (Anzahl an Geschwistern und Ehefrauen an Bord)
- (int)        Parch        (Anzahl an Eltern und Kinder an Bord)
- (num)        Fare         (Ticketpreis)
- (Factor)     Embarked     (Zustiegshafen: Cherbourg = C, Queenstown = Q, Southampton = S)
- (chr)        Title        (Anrede)
- (num)        Bord         (Lage: Backbord = 0; Steuerbord = 1; beides = 2)
- (int)        Deck         (Buchstabe der Kabinennumer:mehrere Decks = 0, A = 1, B = 2, C = 3, ...)
