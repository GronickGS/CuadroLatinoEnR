# Crear un conjunto de datos en R
datos <- data.frame(
  col = c(1, 1, 1, 2, 2, 2, 3, 3, 3),
  hil = c(1, 2, 3, 1, 2, 3, 1, 2, 3),
  treat = c("A", "B", "C", "C", "A", "B", "B", "C", "A"),
  y1 = c(2.02, 2.09, 2.85, 1.95, 2.21, 1.86, 1.65, 2.27, 1.79),
  y2 = c(520, 760, 502, 518, 590, 488, 426, 540, 326)
)

# Notas:
# y1 = materia orgánica
# y2 = potasio (K)

# Convertir las columnas "col" y "hil" en factores
datos$col <- as.factor(datos$col)
datos$hil <- as.factor(datos$hil)

# Verificar los nombres de las columnas en el conjunto de datos "datos"
colnames(datos)

# Ejecutar el análisis de varianza (ANOVA) del cuadrado latino para "y1"
datos2.lm <- lm(y1 ~ hil + col + treat, data = datos)
anova(datos2.lm)

# Validación del modelo
# Prueba de Durbin-Watson para la independencia de observaciones
install.packages("car")
library(car)
require(car)

# Realizar la prueba de Durbin-Watson
durbinwatson_test <- durbinWatsonTest(datos2.lm)
# Mostrar los resultados de la prueba
print(durbinwatson_test)

# Pruebas de homogeneidad de varianzas
# Prueba de Bartlett, H0: var=var
bartlett.test(y1 ~ treat, data = datos)

# Prueba de Tukey para igualdad de tratamientos (paquete agricolae)
install.packages("agricolae")
library(agricolae)
tukey7 = HSD.test(datos2.lm, "treat", alpha = 0.05)
tukey7

# Análisis para "y2" (potasio K)
# ANOVA para el contenido de potasio K
# Ejecutar el análisis de varianza (ANOVA) del cuadrado latino
datosK.lm <- lm(y2 ~ hil + col + treat, datos)
anova(datosK.lm)

# Validación del modelo
# Prueba de Durbin-Watson para la independencia de observaciones
require(car)

# Realizar la prueba de Durbin-Watson
durbinwatson_test <- durbinWatsonTest(datosK.lm)
# Mostrar los resultados de la prueba
print(durbinwatson_test)

# Pruebas de homogeneidad de varianzas
# Prueba de Bartlett, H0: var=var
bartlett.test(y2 ~ treat, data = datos)

# Prueba de Tukey para igualdad de tratamientos (paquete agricolae)
install.packages("agricolae")
library(agricolae)
tukey7 = HSD.test(datosK.lm, "treat", alpha = 0.05)
tukey7
