# ************************************************
# *          Wissenschaftliches Arbeiten         *
# *              GitHub: Gruppe 12               *
# *                                              *    
# *             Gruppenmitglieder:               *
# *             - Inken Veips (I-Veips)          *
# *             - Sam Fujarski (fuwatson88)      *
# *             - Lisa Larrass (lisalarr)        *
# *             - Antonia Koehr (SpotAnti)       *
# *                                              *
# *         Aufgabe 2 (Helfer Funktionen)        *
# *               bearbeitet von allen           *
# ************************************************

# cramersV - Berechnet das Cramers V fuer zwei kategoriale Variablen
#
# Input:     zwei kategoriale Variablen x und y
#
# Output:    eine benannte Liste mit den oben genannten deskriptiven Statistiken

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