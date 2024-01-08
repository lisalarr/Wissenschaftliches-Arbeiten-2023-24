# ************************************************
# *          Wissenschaftliches Arbeiten         *
# *              GitHub: Gruppe 12               *
# *          Aufgabe 2 (Main Funktionen)         *
# ************************************************
library(moments)
source("Aufgabe2_2.R")

# (i)
# metrStat - die Funktion berechnet deskriptive Statistiken fuer metrische 
#            Variablen des Datensatzes. 
#            Berechnet werden die Lagemaße, einschließlich Mittelwert und 5
#            -Punkte-Zusammenfassung; Streeungsmaße mit Varianz und
#            Standardabweichung. Außerdem wurden die Schiefe und Wölbung der
#            Verteilung berechnet. Zuletzt wurde die Anzahl der fehlenden Werte
#            ausgegeben. 
#
# Input:     eine metrische Variable x und na.rm = TRUE als default
#
# Output:    Eine Liste mit den oben genannten deskriptiven Statistiken.

metrStat = function(x, na.rm = TRUE){
  if(is.numeric(x)){stats = list(Mittelwert = mean(x),
                                 Varianz = var(x),
                                 SD = sd(x),
                                 Summary = summary(x),
                                 NAs = sum(is.na(x)),
                                 Schiefe =skewness(x),
                                 Woelbung = kurtosis(x))
  
  return(stats)} 
  else {print("Die Variable ist nicht metrisch.")}
  }

# Test
#metrStat(titanic$Survived)
#metrStat(titanic$Age)

# (ii) 
# katStat - die Funktion berechnet deskriptive Statistiken fuer kategoriale 
#           Variablen des Datensatzes.
#           Berechnet werden der Modus, die absolute und relative Häufigkeit.
#           Bei der relativen Häufigkeit werden die Ergebnisse auf zwei
#           Nachkommastellen aufgerundet. 
#
# Input: Eine kategoriale (factor oder character). 
#
# Output: Eine Liste mit den oben genannten deskriptiven Statistiken. 

katStat = function(x) {
  if(is.factor(x) || is.character(x)){
    # Modalwert
    stats = list(Modalwert = levels(x)[which.max(table(x))],
                 Abs_Haufigkeit = table(x),
                 Rel_Haufigkeit = round(100*prop.table(table(x)),2)
    )
    return(stats)
    
  }
  else print("Die Variable ist nicht kategorial.")
}

# Test
#katStat(titanic$Age)
#katStat(titanic$Survived)

# (iii)
# katBiStat - die Funktion berechnet deskriptive bivariate Statistiken fuer den 
#             Zusammenhang kategorialer Variablen des Datensatzes.
#             Berechnet werden der Chi-Quadrat-Test und Cramers V.
#
#
# Input: Zwei kategoriale Variable x und y
#
# Output: Eine Liste mit den oben genannten deskriptiven Statistiken. 

katBiStat = function(x, y) {
  
  if(all(sapply(list(x,y), function(col) is.factor(col) || is.character(col)))){
    stats = list(chisq = chisq.test(x,y),
                 # Hilfsfunktion in Aufgabe2_2.R programmiert
                 cramersv = cramersV(x, y),
                 Interpretation = "Wertebereich von Cramers V: 0 (keinen stat. Zsh.) bis 1 (perfekten stat. Zsh.")
    return(stats)
    
  }
  else print("Die Variablen sind nicht kategorial.")
}

# Test
#katBiStat(titanic$Survived,titanic$Age)
#katBiStat(titanic$Survived, titanic$Pclass)

# (iv)
# metrBiStat - die Funktion berechnet deskriptive bivariate Statistiken fuer den 
#              Zusammenhang einer metrischen und dichotomen Variable des Daten-
#              satzes.
#              Berechnet werden: ---
#
#
# Input:
#
# Output:

metrBiStat = function() {
  
}

# (v)
# visualise - die Funktion erstellt eine Visualisierung von drei/vier Variablen des 
#             Datensatzes. 
#             Erstellt wird: --- 
#
# Input:
#
# Output:

visualise = function() {
  
}

# (vi)
# ...  