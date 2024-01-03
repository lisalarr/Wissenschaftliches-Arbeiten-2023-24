# ************************************************
# *          Wissenschaftliches Arbeiten         *
# *              GitHub: Gruppe 12               *
# *                  Aufgabe 1                   *
# *        Antonia Koehr und Lisa Larrass        *
# ************************************************
titanic = read.csv("titanic.csv")

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
addAge <- function(data){
  imputeAge = tapply(data$Age, data$Anrede, function(x) {
    meanAge = mean(x, na.rm = TRUE)
    x[is.na(x)] = meanAge
    return(x)
  })
  imputedAge = unlist(imputeAge)
  data$Age = round(imputedAge)
  return(data)
}
titanic <- addAge(titanic)


# Neue Variablen aus „Cabin“ 
# Backbord = 0; Steuerbord = 1; beides = 2
variableCabin <- function(data){
  cabin <- data$Cabin
  cabin[which(cabin == "")] <- NA
  bord <- cabin
  bord[which(nchar(bord) == 1)] <- NA
  bord[which(nchar(bord) == 2)] <- substr(bord[which(nchar(bord) == 2)], 2, 2)
  bord[which(nchar(bord) == 3)] <- substr(bord[which(nchar(bord) == 3)], 2, 3)
  bord[which(nchar(bord) == 4)] <- substr(bord[which(nchar(bord) == 4)], 2, 4)
  bord[which(nchar(bord) == 5)] <- substr(bord[which(nchar(bord) == 5)], 4, 5)
  bord[which(nchar(bord) > 5 & nchar(bord) < 15)] <- 
    substr(bord[which(nchar(bord) > 5 & nchar(bord) < 15)], 2, 3)
  bord[which(nchar(bord) >= 15)] <- 1000
  bord <- as.integer(bord)
  bord[which(bord != 1000)] <- bord[which(bord != 1000)] %% 2
  bord[which(bord == 1000)] <- 2
  data <- cbind(data, bord)
  return(data)
}
titanic <- variableCabin(titanic)


# Deck (vorangehender Buchstabe)
# mehrere Decks = 0, A = 1, B = 2, C = 2, ...
variableDeck <- function(data){
  deck <- data$Cabin
  deck[which(deck == "")] <- NA
  deck[which(nchar(deck) <= 4 | nchar(deck) > 5)] <- 
    substr(deck[which(nchar(deck) <= 4 | nchar(deck) > 5)], 1, 1)
  deck[which(nchar(deck) == 5)] <- substr(deck[which(nchar(deck) == 5)], 1, 3)
  
  for(i in 1:length(LETTERS)){
    deck[which(deck == LETTERS[i])] <- i
  }
  deck[which(nchar(deck) > 1)] <- 0
  deck <- as.integer(deck)
  data <- cbind(data, deck)
  return(data)
}
titanic <- variableDeck(titanic)


# „PassengerID“, „Name“, „Ticket“ und „Cabin“ entfernen
titanic[, c("PassengerID", "Name", "Ticket", "Cabin")] <- list(NULL)

# R-Skript und neuen Datensatz in Repository abspeichern 