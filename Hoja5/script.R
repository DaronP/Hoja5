library(e1071)
library(caret)

set.seed(123)




data1 <- read.csv("train.csv")
data2 <- read.csv("test.csv")

corte <- sample(nrow(data1), nrow(data1)*0.7)

train <- data1[corte,]
test <- data1[-corte,]

#Con solo tres columnas
train1 <- train[c(44,47, 81)]
test1 <- test[c(44,47,81)]


#Modelo en base a lo anterior
modelo <- naiveBayes(SalePrice~.,data = train1)
modelo

predBayes <- predict(modelo, newdata = test1)

predBayes

confusionMatrix(predBayes, test$SalePrice)









