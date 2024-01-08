# ************************************************
# *          Wissenschaftliches Arbeiten         *
# *              GitHub: Gruppe 12               *
# *                  Aufgabe 1                   *
# *        Antonia Koehr und Lisa Larrass        *
# ************************************************

titanic = read.csv("titanic.csv")

# Anreden extrahieren
titanic$Title = gsub("^.*,\\s*([A-Za-z]+)\\..*$", "\\1", titanic$Name)

# Variablen zu Factor umkodieren
# "Survived" mit ja = 1, nein = 2 
titanic$Survived = as.factor(titanic$Survived)
# "Sex" mit male = 0, female = 1 
titanic$Sex = as.factor(ifelse(titanic$Sex == "male", 0, 1))
# "Embarked" mit Cherboourg = C, Queenstown = Q, Southampton = S 
titanic$Embarked = as.factor(titanic$Embarked)

# "Pclass" als ordered-factor
titanic$Pclass = ordered(as.factor(titanic$Pclass))

# NA's von "Age" imputieren (Verfahren: arithmetisches Mittel)
addAge = function(data) {
  imputeAge = tapply(data$Age, data$Title, function(x) {
    meanAge = mean(x, na.rm = TRUE)
    x[is.na(x)] = meanAge
    return(x)
  })
  
  imputedAge = unlist(imputeAge)
  data$Age = round(imputedAge)
  return(data)
}
titanic = addAge(titanic)

# Neue Variablen aus "Cabin" 
# BackBord = 0, SteuerBord = 1, beides = 2
variableCabin = function(data) {
  cabin = data$Cabin
  cabin[which(cabin == "")] = NA
  
  Bord = cabin
  Bord[which(nchar(Bord) == 1)] = NA
  Bord[which(nchar(Bord) == 2)] = substr(Bord[which(nchar(Bord) == 2)], 2, 2)
  Bord[which(nchar(Bord) == 3)] = substr(Bord[which(nchar(Bord) == 3)], 2, 3)
  Bord[which(nchar(Bord) == 4)] = substr(Bord[which(nchar(Bord) == 4)], 2, 4)
  Bord[which(nchar(Bord) == 5)] = substr(Bord[which(nchar(Bord) == 5)], 4, 5)
  Bord[which(nchar(Bord) > 5 & nchar(Bord) < 15)] =
    substr(Bord[which(nchar(Bord) > 5 & nchar(Bord) < 15)], 2, 3)
  Bord[which(nchar(Bord) >= 15)] = 1000
  Bord = as.integer(Bord)
  Bord[which(Bord != 1000)] = Bord[which(Bord != 1000)] %% 2
  Bord[which(Bord == 1000)] = 2
  
  data = cbind(data, Bord)
  return(data)
}
titanic = variableCabin(titanic)

# Deck (vorangehender Buchstabe)
# Mehrere Decks = 0, A = 1, B = 2, C = 3, ...
variableDeck = function(data) {
  Deck = data$Cabin
  Deck[which(Deck == "")] = NA
  Deck[which(nchar(Deck) <= 4 | nchar(Deck) > 5)] =
    substr(Deck[which(nchar(Deck) <= 4 | nchar(Deck) > 5)], 1, 1)
  Deck[which(nchar(Deck) == 5)] = substr(Deck[which(nchar(Deck) == 5)], 1, 3)
  
  for(i in 1:length(LETTERS)) {
    Deck[which(Deck == LETTERS[i])] = i
  }
  
  Deck[which(nchar(Deck) > 1)] = 0
  Deck = as.integer(Deck)
  data = cbind(data, Deck)
  return(data)
}
titanic = variableDeck(titanic)

# "PassengerID", "Name", "Ticket" und "Cabin" entfernen
titanic[ , c("PassengerId", "Name", "Ticket", "Cabin")] = list(NULL)

# Aktualisierten Datensatz fuer GitHub speichern
save(titanic, file = "titanic_new.RData")
