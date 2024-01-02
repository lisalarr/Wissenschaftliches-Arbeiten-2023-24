# ************************************************
# *          Wissenschaftliches Arbeiten         *
# *              GitHub: Gruppe 12               *
# ************************************************

titanic = read.csv("~/TU Dortmund/3. Semester/Wissenschaftliches Arbeiten/Gruppenarbeit/titanic.csv")

# Aufgabe 1 

# Anreden extrahieren
# „Survived“, „Sex“, „Embarked“ zu factor umkodieren
# „Pclass“ als ordered-factor
# NA's von „Age“ imputieren (z.B. arithmetisches Mittel, Median, usw.)
# Neue Variablen aus „Cabin“ 
  # Backbord (gerade Nummer), Steuerbord (ungerade Nummer)
  # Deck (vorangehender Buchstabe)  
  # NA (unbekannte Kabinennummer)
# „PassengerID“, „Name“, „Ticket“ und „Cabin“ entfernen

# R-Skript und neuen Datensatz in Repository abspeichern 