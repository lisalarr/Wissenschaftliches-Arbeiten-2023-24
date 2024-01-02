# ************************************************
# *          Wissenschaftliches Arbeiten         *
# *              GitHub: Gruppe 12               *
# ************************************************

titanic = read.csv("~/TU Dortmund/3. Semester/Wissenschaftliches Arbeiten/Gruppenarbeit/titanic.csv")

# Aufgabe 1 

# Anreden extrahieren
titanic$Anrede = gsub("^.*,\\s*([A-Za-z]+)\\..*$", "\\1", titanic$Name)

# „Survived“, „Sex“, „Embarked“ zu factor umkodieren
titanic$Survived = as.factor(titanic$Survived)
titanic$Sex = as.factor(titanic$Sex)
titanic$Embarked = as.factor(titanic$Embarked)

# „Pclass“ als ordered-factor
titanic$Pclass = ordered(as.factor(titanic$Pclass))

# NA's von „Age“ imputieren (Verfahren: arithmetisches Mittel)
# Gruppierung nach Anrede und Berechnung vom mean
imputeAge = tapply(titanic$Age, titanic$Anrede, function(x) {
  meanAge = mean(x, na.rm = TRUE)
  x[is.na(x)] = meanAge
  return(x)
})
imputedAge = unlist(imputeAge)
titanic$Age = imputedAge

# Neue Variablen aus „Cabin“ 
  # Backbord (gerade Nummer), Steuerbord (ungerade Nummer)
  # Deck (vorangehender Buchstabe)  
  # NA (unbekannte Kabinennummer)
# „PassengerID“, „Name“, „Ticket“ und „Cabin“ entfernen

# R-Skript und neuen Datensatz in Repository abspeichern 