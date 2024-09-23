# CC216--TP-2024-2

- Objetivo del trabajo:
  Realizar un análisis exploratorio de un conjunto de datos (EDA), generando visualizaciones, preparando los datos y extrayendo conclusiones iniciales utilizando R/RStudio como herramienta de software.

- Nombre de los alumnos participantes:
  Carlos Alejandro Molina Huatuco (U20211G139)
  Lucero Salome Manchay Paredes (202216120)
  José Antonio Mayhua Hinostroza (202218044)

- Breve descripcion del dataset:

El archivo "hotel_bookings.csv" contiene 119,390 registros de reservas de hoteles. Incluye detalles como el tipo de hotel, fechas de llegada, número de personas, cancelaciones, tarifas diarias y solicitudes especiales, entre otros datos relacionados con la gestión de reservas y clientes.
Algunas de las columnas más relevantes son:

hotel: Tipo de hotel (City Hotel o Resort Hotel).
is_canceled: Indicador de cancelación (1 si la reserva fue cancelada, 0 en caso contrario).
lead_time: Tiempo en días entre la reserva y la llegada.
arrival_date_year: Año de llegada.
arrival_date_month: Mes de llegada.
adults, children, babies: Número de adultos, niños y bebés en la reserva.
meal: Tipo de régimen alimenticio reservado.
country: País de origen del cliente.
market_segment: Segmento de mercado de la reserva.
previous_cancellations: Número de cancelaciones previas del cliente.
reserved_room_type, assigned_room_type: Tipo de habitación reservada y asignada.
adr: Tarifa diaria promedio.
total_of_special_requests: Número de solicitudes especiales realizadas.

- Conclusiones
 ¿Qué patrones o tendencias se observaron?

 Patrones estacionales en las reservas: Como mostramos en el gráfico de líneas, se ve un patrón estacional claro, ya que las reservas suelen aumentar durante los meses de verano y disminuyen durante los meses más fríos o fuera de temporada. Además, esto indica que los    hoteles experimentan un ciclo de alta y baja demanda, lo cual ayuda para contratar mayor o menor personal durante algunas épocas.
 Patrones de preferencia de los clientes: Como mostramos en el gráfico de barras se identificó  que un tipo de hotel tiene más reservas que el otro. Esto puede ser una indicación de que los clientes prefieren los hoteles que están más orientados a la relajación y las     actividades recreativas, especialmente durante las vacaciones. Además, se logró observar que hay ciertos segmentos de mercado o tipos de clientes que son más predominantes, por lo que los hoteles tienen un público objetivo mejor definido y pueden orientar sus servicios  y estrategias de marketing de una manera efectiva.
 Relación entre noches entre semana y fines de semana: Como mostramos en el gráfico de dispersión entre stays_in_week_nights y stays_in_weekend_nights muestra que, aunque la mayoría de los clientes se quedan más noches entre semana, hay algunos que prefieren pasar más    tiempo en el hotel durante el fin de semana, lo que podría deberse a escapadas cortas o viajes de placer.
 Distribución de las tarifas diarias: Como mostramos en el histograma, se visualiza que la mayoría de las tarifas diarias se concentran en un rango medio (por ejemplo, entre $50 y $150 por noche). Sin embargo, hay algunos valores atípicos que representan tarifas muy      elevadas o muy bajas, lo que podría estar relacionado con promociones, eventos especiales, o diferentes niveles de habitaciones o paquetes.
 
 ¿Qué recomendaciones se pueden extraer a partir de los hallazgos? 

 Optimización de estrategias de precios y ofertas: Con base en los patrones estacionales observados, se recomienda ajustar las tarifas según la demanda. Durante los meses de alta demanda (verano o vacaciones), el hotel puede aumentar las tarifas, mientras que durante la  temporada baja, se pueden ofrecer descuentos o paquetes promocionales para atraer a más clientes. Además, el análisis de la distribución de ADR sugiere que las tarifas están concentradas en un rango medio. El hotel podría evaluar la posibilidad de crear paquetes         diferenciados para captar tanto a clientes de presupuesto medio como a aquellos que estén dispuestos a pagar tarifas más altas por servicios premium.

 Campañas de marketing segmentadas: Dado que ciertos tipos de hoteles, como los Resort Hotels, parecen tener más demanda, se pueden diseñar campañas de marketing enfocadas en atraer a este tipo de cliente. Se podría reforzar la promoción de los servicios recreativos, el  relax, o las vacaciones familiares que ofrecen los resorts. Asimismo, el hotel puede explorar cómo atraer a más clientes al City Hotel, quizás con promociones enfocadas en el turismo de negocios o viajes cortos.

 Ajuste en la oferta de servicios: La relación observada entre la duración de la estancia entre semana y los fines de semana podría sugerir que ciertos grupos de clientes están más interesados en escapadas de fin de semana. El hotel podría aprovechar esto ofreciendo      paquetes especiales para estadías cortas, como fines de semana con actividades incluidas o descuentos en servicios adicionales (como cenas o spa).

 Gestión de recursos y personal: Dado el patrón estacional en las reservas, el hotel debería ajustar su planificación de recursos y personal según la demanda esperada. Durante los meses de alta demanda, es necesario contar con más personal y mayor disponibilidad de       servicios, mientras que en temporada baja, se podría reducir la capacidad operativa para controlar costos.

- Licencia
MIT License

Copyright (c) 2024 Lucero Salome Manchay Paredes

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
