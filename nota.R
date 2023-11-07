# Crear un conjunto de datos en R
datos <- data.frame(
  col = c(1, 1, 1, 2, 2, 2, 3, 3, 3),
  hil = c(1, 2, 3, 1, 2, 3, 1, 2, 3),
  treat = c("A", "B", "C", "C", "A", "B", "B", "C", "A"),
  y1 = c(2.02, 2.09, 2.85, 1.95, 2.21, 1.86, 1.65, 2.27, 1.79),
  y2 = c(520, 760, 502, 518, 590, 488, 426, 540, 326)
)
# y1 = materia organica
# y2 = potacio (k)

# Convertir las columnas "col" y "hil" en factores
datos$col <- as.factor(datos$col)
datos$hil <- as.factor(datos$hil)

# Verificar los nombres de las columnas en el conjunto de datos "datos"
colnames(datos)


# ejecuta el anova del cuadrado latino
datos2.lm <- lm(y1 ~ hil + col + treat, data = datos)
anova(datos2.lm)


#validacion del modelo
## prueba de durbin watson para la independencia de observaciones
install.packages("car")
library(car)
require(car)

# Realizar la prueba de Durbin-Watson
durbinwatson_test <- durbinWatsonTest(datos2.lm)
# Mostrar los resultados de la prueba
print(durbinwatson_test)

#pruebas de homogeneidad de varianzas
#prueba de batlet, el HO: var=var
bartlett.test(y1~treat,data = datos)


# Prueba de tukey para igualdad de tratamiento agricolae
install.packages("agricolae")
library(agricolae)
tukey7=HSD.test(datos.lm,"treat",alpha = 0.05)
tukey7

#### POTASIO ###
#anova para contenido de potasio k
##ejecuta el anova del cuadrado latino
datosK.lm <- lm(y2~hil+col+treat,datos)
anova(datosK.lm)

#validacion del modelo
## prueba de durbin watson para la independencia de observaciones
require(car)
# Realizar la prueba de Durbin-Watson
durbinwatson_test <- durbinWatsonTest(datosK.lm)
# Mostrar los resultados de la prueba
print(durbinwatson_test)

#pruebas de homogeneidad de varianzas
#prueba de batlet, el HO: var=var
bartlett.test(y2~treat,data = datos)

# Prueba de tukey para igualdad de tratamiento agricolae
install.packages("agricolae")
library(agricolae)
tukey7=HSD.test(datosK.lm,"treat",alpha = 0.05)
tukey7