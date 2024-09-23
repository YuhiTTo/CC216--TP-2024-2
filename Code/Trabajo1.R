#ANÁLISIS EXPLORATORIO DE DATOS

#CARGAR DATOS:
#Primero hay que agregar las librerías que usaremos (si no las tienen descargadas):
install.packages("ggplot2", dependencies = TRUE)
install.packages("cowplot", dependencies = TRUE)
install.packages("patchwork", dependencies = TRUE)
install.packages("rvest", dependencies = TRUE)
install.packages("XML", dependencies = TRUE)
install.packages("gridExtra", dependencies = TRUE)
install.packages("tidyverse", dependencies = TRUE)
install.packages("VIM", dependencies = TRUE)
install.packages("mlr", dependencies = TRUE)

#Se llama a las librerias:
library(ggplot2)
library(cowplot)
library(patchwork)
library(rvest) 
library(XML)  
library(gridExtra)
library(tidyverse)
library(VIM)
library(mlr)

#Luego hay que incluir a Rstudio el dataset con el que trabajará (la ruta depende de cada persona):

setwd("C:/Users/USER/Documents/RstudioData")
data_orignal<-read.csv('hotel_bookings.csv', header=TRUE,sep=',',dec='.')
data_trabajada<-read.csv('hotel_bookings.csv', header=TRUE,sep=',',dec='.')
#Una vez se haya cargado correctamente los datos hay que cambiarlos al tipo correcto:

data_trabajada$hotel<-as.factor(data_trabajada$hotel)
data_trabajada$is_canceled <- as.factor(data_trabajada$is_canceled)
data_trabajada$is_repeated_guest <- as.factor(data_trabajada$is_repeated_guest)
data_trabajada$arrival_date_month <- as.factor(data_trabajada$arrival_date_month)
data_trabajada$is_canceled <- as.factor(data_trabajada$is_canceled)
data_trabajada$is_repeated_guest <- as.factor(data_trabajada$is_repeated_guest)
data_trabajada$meal <- as.factor(data_trabajada$meal)
data_trabajada$country <- as.factor(data_trabajada$country)
data_trabajada$market_segment <- as.factor(data_trabajada$market_segment)
data_trabajada$distribution_channel <- as.factor(data_trabajada$distribution_channel)
data_trabajada$reserved_room_type <- as.factor(data_trabajada$reserved_room_type)
data_trabajada$assigned_room_type <- as.factor(data_trabajada$assigned_room_type)
data_trabajada$deposit_type <- as.factor(data_trabajada$deposit_type)
data_trabajada$customer_type <- as.factor(data_trabajada$customer_type)
data_trabajada$reservation_status <- as.factor(data_trabajada$reservation_status)
data_trabajada$arrival_date_month <- as.factor(data_trabajada$arrival_date_month)
data_trabajada$arrival_date_year <- as.factor(data_trabajada$arrival_date_year)
data_trabajada$arrival_date_week_number <- as.factor(data_trabajada$arrival_date_week_number)
data_trabajada$arrival_date_day_of_month <- as.factor(data_trabajada$arrival_date_day_of_month)
data_trabajada$adults <- as.factor(data_trabajada$adults)
data_trabajada$children <- as.factor(data_trabajada$children)
data_trabajada$babies <- as.factor(data_trabajada$babies)
data_trabajada$agent <- as.factor(data_trabajada$agent)
data_trabajada$company <- as.factor(data_trabajada$company)
data_trabajada$days_in_waiting_list <- as.factor(data_trabajada$days_in_waiting_list)
data_trabajada$required_car_parking_spaces <- as.factor(data_trabajada$required_car_parking_spaces)
data_trabajada$total_of_special_requests <- as.factor(data_trabajada$total_of_special_requests)
data_trabajada$reservation_status_date <- as.Date(data_trabajada$reservation_status_date)


#INSPECCIONAR DATOS:
#Se muestra la cantidad de filas y columnas del dataset:
dim(data_trabajada)
#Tipo de datos de cada columna:
str(data_trabajada)
#Se da una muestra de los datos de la columna:
head(data_trabajada)
#Estadísticas del dataset:
summary(data_trabajada)

ggplot(data_trabajada, aes(x = hotel)) +
  geom_bar() +
  labs(title = "Distribución de Reservas por Tipo de Hotel", x = "Tipo de Hotel", y = "Número de Reservas")


ggplot(data_trabajada, aes(x = arrival_date_month, group = 1)) +
  geom_line(stat = "count") +
  labs(title = "Evolución de Reservas por Mes", x = "Mes de Llegada", y = "Número de Reservas")



ggplot(data_trabajada, aes(x = adr)) +
  geom_histogram(binwidth = 10) +
  labs(title = "Distribución de ADR (Average Daily Rate)", x = "ADR", y = "Frecuencia")

ggplot(data_trabajada, aes(x = stays_in_week_nights, y = stays_in_weekend_nights)) +
  geom_point(alpha = 0.6, color = "blue") +  # Puntos con algo de transparencia
  labs(title = "Relación entre Noches entre Semana y Noches de Fin de Semana",
       x = "Noches entre Semana",
       y = "Noches de Fin de Semana") +
  theme_minimal()


#PRE-PROCESAR DATOS

#IDENTIFICACIÓN DE DATOS FALTANTES:
aggr(data_trabajada,numbers=T,sortVar=T)

#TRATAMIENTO DE DATOS FALTANTES
#Lo que se va a hacer en la columna 'CHILDREN' es reemplazar la cantidad de niños con NA's con la moda

moda <- function(v) {
  uniq_v <- unique(v)
  uniq_v[which.max(tabulate(match(v, uniq_v)))]
}
moda_children <- moda(data_trabajada$children[!is.na(data_trabajada$children)])

# Reemplazamos los NA con la moda
data_trabajada$children[is.na(data_trabajada$children)] <- moda_children
summary(data_trabajada$children)

#IDENTIFICACION DE DATOS ATÍPICOS (OUTLIERS)

#Creamos un gráfico de caja para lead_time
ggplot(data_trabajada, aes(x = lead_time)) +
  geom_boxplot() +
  labs(title = "Boxplot de Lead Time", x = "Lead Time")

#Creamos un gráfico de caja para stays_in_weekend_nights
ggplot(data_trabajada, aes(x = stays_in_weekend_nights)) +
  geom_boxplot() +
  labs(title = "Boxplot de Noches en el Fin de Semana", x = "Noches en el Fin de Semana")

#Creamos un gráfico de caja para adr (Average Daily Rate)
ggplot(data_trabajada, aes(x = adr)) +
  geom_boxplot() +
  labs(title = "Boxplot de ADR (Average Daily Rate)", x = "ADR")

#Creamos un gráfico de caja para stays_in_week_nights
ggplot(data_trabajada, aes(x = stays_in_week_nights)) +
  geom_boxplot() +
  labs(title = "Boxplot de Noches entre Semana", x = "Noches entre Semana")

#Creamos un gráfico para las columas numericas
numeric_columns <- sapply(data_trabajada, is.numeric)
data_numeric <- data_trabajada[, numeric_columns]

for (col in names(data_numeric)) {
  print(
    ggplot(data_trabajada, aes_string(x = col)) +
      geom_boxplot() +
      labs(title = paste("Boxplot de", col), x = col)
  )
}

#TRATAMIENTOS DE DATOS ATÍPICOS

#Reemplazamos con el IQR
columna <- "adr"
summary(data_trabajada[[columna]])
Q1 <- quantile(data_trabajada[[columna]], 0.25, na.rm = TRUE)
Q3 <- quantile(data_trabajada[[columna]], 0.75, na.rm = TRUE)
IQR <- Q3 - Q1
lower_bound <- Q1 - 1.5 * IQR
upper_bound <- Q3 + 1.5 * IQR
data_trabajada[[columna]][data_trabajada[[columna]] < lower_bound] <- lower_bound
data_trabajada[[columna]][data_trabajada[[columna]] > upper_bound] <- upper_bound

summary(data_trabajada[[columna]])

ggplot(data_trabajada, aes(x = adr)) +
  geom_boxplot() +
  labs(title = "Boxplot de ADR (Average Daily Rate) sin outliers", x = "ADR")

numeric_columns <- sapply(data_trabajada, is.numeric)

#BUCLE PARA LAS COLUMNAS NUMERICAS
for (col in names(data_trabajada)[numeric_columns]) {
  Q1 <- quantile(data_trabajada[[col]], 0.25, na.rm = TRUE)
  Q3 <- quantile(data_trabajada[[col]], 0.75, na.rm = TRUE)
  IQR <- Q3 - Q1
  lower_bound <- Q1 - 1.5 * IQR
  upper_bound <- Q3 + 1.5 * IQR
  data_trabajada[[col]][data_trabajada[[col]] < lower_bound] <- lower_bound
  data_trabajada[[col]][data_trabajada[[col]] > upper_bound] <- upper_bound
}




























