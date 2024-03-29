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
# *          Aufgabe 2 (Main Funktionen)         *
# *               bearbeitet von allen           *
# ************************************************

library(moments) # fuer die Berechnung von Momenten und deskriptiven Statistiken
library(ggplot2) # fuer das erweiterte Plotten ueber base-R hinweg
library(cowplot) # fuer die Grid-Darstellung in (vi) 

# Hilfsfunktionen laden
source("Aufgabe2_2.R")

# (i)

# metrStat - die Funktion berechnet deskriptive Statistiken fuer metrische 
#            Variablen des Datensatzes. 
#            Berechnet werden die Lagemasse, einschliesslich Mittelwert und der
#            Fuenf-Punkte-Zusammenfassung; Streeungsmasse mit Varianz und
#            Standardabweichung. Ausserdem werden die Schiefe und Woelbung der
#            Verteilung berechnet. Zuletzt wird die Anzahl der fehlenden Werte
#            ausgegeben. 
#
# Input:     eine metrische Variable x mit na.rm = TRUE als default
#
# Output:    eine benannte Liste mit den sieben oben genannten Statistiken

metrStat = function(x, na.rm = TRUE) {
  if(is.numeric(x)){
    stats = list(Mittelwert = mean(x),
                 Varianz = var(x),
                 SD = sd(x),
                 Quartile = quantile(x),
                 NAs = sum(is.na(x)),
                 Schiefe = skewness(x),
                 Woelbung = kurtosis(x))
    return(stats)
  } else {
    print("Die Variable ist nicht metrisch.")
  }
}
# Test
# metrStat(titanic$Survived)
# Wie erwartet wird ausgegeben, dass die Variable nicht metrisch ist.
# metrStat(titanic$Age)

# (ii) 

# katStat - die Funktion berechnet deskriptive Statistiken fuer kategoriale 
#           Variablen des Datensatzes.
#           Berechnet werden der Modus, die absolute und relative Haeufigkeit.
#           Bei der relativen Haeufigkeit werden die Ergebnisse auf zwei
#           Nachkommastellen aufgerundet. 
#
# Input:    eine kategoriale Variable x (factor oder character)
#
# Output:   eine benannte Liste mit den drei oben genannten Statistiken 

katStat = function(x) {
  if(is.factor(x) || is.character(x)) {
    stats = list(Modalwert = levels(x)[which.max(table(x))],
                 Abs_Haufigkeit = table(x),
                 Rel_Haufigkeit = round(100 * prop.table(table(x)), 2))
    return(stats)
  } else {
    print("Die Variable ist nicht kategorial.")
  }
}

# Test
# katStat(titanic$Age)
# Wie erwartet, wird ausgegeben, dass die Variable nicht kategorial ist.
# katStat(titanic$Survived)

# (iii)

# katBiStat - die Funktion berechnet deskriptive bivariate Statistiken fuer den 
#             Zusammenhang kategorialer Variablen des Datensatzes.
#             Berechnet werden der Chi-Quadrat-Test und Cramers V.
#
# Input:      zwei kategoriale Variablen x und y
#
# Output:     eine Liste mit den zwei genannten Statistiken und Interpretation

katBiStat = function(x, y) {
  if(all(sapply(list(x, y), function(col) is.factor(col) || is.character(col)))){
     stats = list(round(100*prop.table(table(x,y), margin = 1),2),
      chisq = chisq.test(x, y),
                 # Hilfsfunktion in Aufgabe2_2.R programmiert
                 cramersv = cramersV(x, y),
                 Interpretation = "Wertebereich von Cramers V: 0 (keinen stat. Zsh.) bis 1 (perfekten stat. Zsh.")
    return(stats)
  } else {
    print("Die Variablen sind nicht kategorial.")
  }
}

# Test
# katBiStat(titanic$Survived,titanic$Age)
# Wie erwartet, wird ausgegeben, dass nicht beide Variablen kategorial sind.
# katBiStat(titanic$Survived, titanic$Pclass)

# (iv)

# metrBiStat - die Funktion berechnet verschiedene deskriptive bivariate 
#              Statistiken fuer den Zusammenhang einer metrischen und dichotomen 
#              Variable des Datensatzes.
#
# Input:       metric:      ein numerischer, metrischer Vektor
#              dichotomous: ein Vektor mit zwei Auspraegungen
#
# Output:      eine benannte Liste mit den Listeneintraegen
#              mean, variance, standard deviation, skweness, kurtosis, minimum, 
#              maximum, median

metrBiStat = function(metric, dichotomous) {
  stopifnot(length(unique(dichotomous)) == 2, 
            (is.integer(dichotomous) | is.factor(dichotomous)),
            is.numeric(metric))
  
  mean_res = tapply(metric, dichotomous, mean)
  var_res = tapply(metric, dichotomous, var)
  sd_res = tapply(metric, dichotomous, sd)
  skewness_res = tapply(metric, dichotomous, skewness)
  kurtosis_res = tapply(metric, dichotomous, kurtosis)
  min_res = tapply(metric, dichotomous, min)
  max_res = tapply(metric, dichotomous, max)
  median_res = tapply(metric, dichotomous, median)
  test_res = t.test(metric ~ dichotomous)
  
  list_names = c("mean", "variance", "standard deviation", "skewness", 
                  "kurtosis", "minimum", "maximum", "median", "t-Test")
  res_list = list(mean_res, var_res, sd_res, skewness_res, kurtosis_res,
                   min_res, max_res, median_res, test_res)
  
  return(setNames(res_list, list_names))
}
# Test
# metrBiStat(titanic$Title, titanic$Bord)
# Wie erwartet koennen keine Statistiken erstellt werden.
# metrBiStat(titanic$Fare, titanic$Sex)

# (v)

# visualise - die Funktion kann Balkendiagramm fuer alle kategorialen Variablen
#             Variablen erstellen
#
# Input:      die auszuwertende Variable data
#
# Output:     ein Balkendiagramm

visualise = function(data) {
  stopifnot(is.factor(data) | is.integer(data))
  
  allVec = unique(data)
  
  getQuantity = function(i) {
    length(data[which(data == allVec[i])])
  }
  quantity = vapply(1:length(allVec), getQuantity, FUN.VALUE = 1)
  allVec = as.numeric(as.character(allVec))
  save = cbind(allVec, quantity)
  save = save[order(save[, "quantity"]), ]
  upper_ylim = ceiling(max(quantity)/100) * 100
  
  barplot(save[, "quantity"], 
          col = colorRampPalette(colors = c("lightblue", "blue"))(length(quantity)), 
          ylim = c(0, upper_ylim),
          names.arg = save[, "allVec"], 
          main = paste("Barchart", deparse(substitute(data))))
  
  grid(nx = 0, ny = (upper_ylim) 
       / ((upper_ylim) / 10))
}

# Test
# visualise(titanic$Deck)

# (vi)

# extraUnivariate - generierte eine kombinierte Visualisierung, um den Datensatz
#                   univariat zu betrachten. Dabei werden zwei Plots erstellt.
#                   Ein Boxplot und ein Histogramm.
#
# Input:     data - ein Data Frame (die zu analysierenden Daten)
#        variable - eine Variable (zu analyiseren)
# 
# Output:           ein (1x2)-Gitter, das die Plots enthaelt

extraUnivariate = function(data, variable) {
  stopifnot(!is.null(data) & nrow(data) > 0, 
            is.character(variable), variable %in% names(data))
  
  # Boxplot der Variable
  boxplot = ggplot(data, aes(y = !!sym(variable))) +
    geom_boxplot(fill = "lightgreen", alpha = 0.7) +
    labs(title = paste("Boxplot for", variable), 
         y = variable)
  
  # Histogramm der Variable
  histogram = ggplot(data, aes(x = !!sym(variable))) +
    geom_histogram(fill = "salmon", alpha = 0.7) +
    labs(title = paste("Histogram for", variable),
         x = variable, y = "Count")
  
  print(plot_grid(boxplot, histogram, ncol = 2))
}

# Test
# extraUnivariate(titanic, "Age")

# extraMultivariate - generiert eine kombinierte Visualisierung, um den Daten-
#                     satz multivariat zu analysieren. Dabei werden vier Plots
#                     erstellt. Ein gestapeltes Histogramm, Boxplots und ein 
#                     Scatterplot mit linearer Regression.
#
# Input:       data - ein Data Frame (die zu analysierenden Daten)
#         variable1 - eine Variable (zu analyiseren)
#         variable2 - eine Variable (zu analysieren)
#          colorVar - eine Variable (fuer die Farbkodierung)
#
# Output:             ein (2x2)-Gitter, das die Plots enthaelt 

extraMultivariate = function(data, variable1, variable2, colorVar) {
  stopifnot(!is.null(data) & nrow(data) > 0,
            !is.numeric(variable1), !is.numeric(variable2),
            length(variable1) == length(variable2))
  
  # Gestapeltes Histogramm der Variablen 
  histogram = ggplot(data, aes(x = !!sym(variable1), 
                               fill = !!sym(colorVar))) +
    geom_histogram(position = "stack", bins = 30, alpha = 0.7) +
    labs(title = paste("Stacked Histogram for", variable1),
         x = variable1, y = "Count", 
         fill = colorVar)
  
  # Nebeneinanderstellung der Boxplots
  # Beim Bearbeiten von Aufgabe 4 ist aufgefallen, dass es durch diese Funktion  
  # zu einer redundanten Darstellung kommt, die keinen Mehrwert fuer die Analyse
  # bietet, weswegen der folgende Teil auskommentiert ist.
  # boxplots = ggplot(data, aes(x = !!sym(variable2), 
  #                            y = !!sym(variable1), 
  #                            fill = !!sym(colorVar))) +
  #  geom_boxplot() +
  #  labs(title = paste("Boxplots for", variable1, "and", variable2),
  #       x = variable2, y = variable1, 
  #       fill = colorVar)
  
  # Scatterplot mit linearen Regressionsgeraden
  regression_model = lm(data[[variable2]] ~ data[[variable1]], data = data)
  regression_summary = summary(regression_model)
  regression_eqn = paste("y =", round(regression_summary$coefficients[2], 2), 
                         "x +", round(regression_summary$coefficients[1], 2))
  regression_plot = ggplot(data, aes(x = !!sym(variable1), 
                                     y = !!sym(variable2), 
                                     color = !!sym(colorVar))) +
    geom_point(alpha = 0.7) +
    geom_smooth(method = "lm", se = FALSE) +  
    geom_text(x = max(data[[variable1]]), 
              y = min(data[[variable2]]),
              label = regression_eqn, 
              hjust = 1, vjust = 0) +
    labs(title = paste("Linear Regression for", variable1, "and", variable2),
         x = variable1, y = variable2, 
         color = colorVar)
  
  print(plot_grid(histogram, regression_plot, boxplots, ncol = 2))
}

# Test
# extraMultivariate(titanic, "Age", "Fare", "Survived")