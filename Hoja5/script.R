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
modeloX1 <- naiveBayes(X1stFlrSF~ SalePrice,data = train)
modeloGr <- naiveBayes(GrLivArea~ SalePrice,data = train1)


predBayesX1 <- predict(modeloX1, newdata = test)
predBayesGr <-predict(modeloGr, newdata = test1)


confusionMatrix(predBayes, test$X1stFlrSF)

#-----------------------------------

ct <- trainControl(method = "cv", train1[,1:3], number = 10, verboseIter = T)
modeloCaret <- train(SalePrice~., data = data1, method = "nb", trControl = ct)






