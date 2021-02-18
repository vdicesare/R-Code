setwd("~/Desktop/UBA")
library(openxlsx)
library(dplyr)

bbddcompleta <- read_excel("bbddcompleta.xlsx")

t <- bbddcompleta$TÍTULO

# convertir caracteres a minúscula 
t <- tolower(t)
t

# quitar espacios de cadenas de caracteres
t <- gsub("\\s", "", t)
t

# quitar puntuación
t <- gsub("[[:punct:]]", "", t)
t

# crear data frame con nueva columna t
nuevat <- cbind(bbddcompleta, t)
nuevat

# eliminar duplicados sobre nuevo dataframe
nuevat <- distinct(nuevat, t, .keep_all = TRUE)
nuevat

# exportar data frame a excel
write.xlsx(nuevat, "~/Desktop/UBA/nuevat.xlsx")
