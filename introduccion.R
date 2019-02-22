data("Titanic")
View(Titanic)

titanic <- as.data.frame(Titanic)

# Modelo de bechmark
benchmark <- glm(data=titanic, family="binomial", formula=Survived ~ Class+Sex+Age, weights=titanic$Freq)
summary(benchmark)

#install.packages("e1071")
library(e1071)

nb <- naiveBayes(Survived~Class+Sex+Age, data=Titanic)
summary(nb)


predict(nb, newdata = Titanic)
cbind(titanic, predict(nb, newdata = Titanic))


predict(benchmark, newdata= Titanic, type="response") > 0.6


View(cbind(titanic, predict(nb, newdata = Titanic), predict(benchmark, newdata=Titanic, type="response") > 0.6))


nb2 <- naiveBayes(Survived~Class+Sex+Age+Sex*Class, data=Titanic) # no se pueden hacer con efectos interactivos





