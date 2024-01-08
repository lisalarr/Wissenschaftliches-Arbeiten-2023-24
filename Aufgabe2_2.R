# ************************************************
# *          Wissenschaftliches Arbeiten         *
# *              GitHub: Gruppe 12               *
# *         Aufgabe 2 (Helfer Funktionen)        *
# ************************************************

# cramersV - Berechnet das Cramers V fuer zwei kategoriale Variablen
#
# Input: Zwei kategoriale Variable x und y
#
# Output: Eine Liste mit den oben genannten deskriptiven Statistiken. 

cramersV = function(col1, col2){
  
  # Haeufigkeitstabelle und Anzahl
  h_table = table(col1, col2)
  n = sum(h_table)
  
  # Chi-Quadrat-Test berechnen
  chiSquareTest = chisq.test(h_table)
  
  # Berechnung von Cramers V
  minDim = min(dim(h_table)) - 1
  v = sqrt(chiSquareTest$statistic / (n * minDim))
}


