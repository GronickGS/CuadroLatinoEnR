# Análisis de Cuadrado Latino en R

Este proyecto de análisis en R se centra en la realización de un diseño de cuadrado latino y la ejecución de varias pruebas y análisis estadísticos en dos variables de interés: materia orgánica (y1) y potasio (y2) en función de tres factores: col, hil y treat.

## Conjunto de Datos

Se crea un conjunto de datos en R con las siguientes columnas y valores:

- `col`: Niveles 1, 2 y 3.
- `hil`: Niveles 1, 2 y 3.
- `treat`: Tratamientos "A", "B" y "C".
- `y1`: Valores numéricos para materia orgánica.
- `y2`: Valores numéricos para potasio (K).

## Conversión de Columnas en Factores

Las columnas `col` y `hil` se convierten en factores para su posterior análisis.

## Análisis de Varianza (ANOVA)

Se realiza un análisis de varianza (ANOVA) del cuadrado latino en R para la variable de respuesta `y1`. El modelo lineal se ajusta utilizando las columnas `hil`, `col` y `treat`.

## Prueba de Durbin-Watson

Se verifica la independencia de observaciones en el modelo mediante la prueba de Durbin-Watson utilizando el paquete "car". Los resultados de la prueba se muestran en la salida.

## Prueba de Homogeneidad de Varianzas

Se realiza una prueba de Bartlett para evaluar la homogeneidad de las varianzas entre los tratamientos para la variable `y1`. El resultado de la prueba se muestra en la salida.

## Prueba de Tukey

Se realiza una prueba de Tukey para comparar la igualdad de tratamientos para la variable `y1` utilizando el paquete "agricolae". Los resultados de la prueba se muestran en la salida.

## ANOVA para "y2" (Potasio K)

Se repiten los pasos anteriores para la variable `y2` (potasio K). Se realiza un análisis de varianza (ANOVA), se verifica la independencia de observaciones, se realiza una prueba de homogeneidad de varianzas y una prueba de Tukey para igualdad de tratamientos.

## Requisitos

Para ejecutar este código, es necesario tener instalados los paquetes "car" y "agricolae". Puedes instalar estos paquetes con los siguientes comandos:

R
install.packages("car")
install.packages("agricolae")

## Ejecución
El código se puede ejecutar en RStudio o cualquier otro entorno de R. Asegúrate de tener los requisitos instalados y simplemente copia y pega el código en R.

## Licencia
Este proyecto se distribuye bajo la Licencia MIT. Consulta el archivo LICENSE para más detalles.
