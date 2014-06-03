setwd("~/Documents/integracao_r_ruby/r_scripts")

# criacao do modelo
#library(party)
library(randomForest)
data(iris)

#model <- ctree(Species ~ . , data=iris)
#save(model, file="../model/modelIris.rda")

model <- randomForest(Species ~ . , data=iris)
save(model, file="../model/modelIrisRandomForest.rda")

# exemplo de uso
novasFlores <- data.frame(c(0.5, 0.8, 1.1, 2), 
                       c(0.6, 0.5, 1.0, 2.2),
                       c(1, 1.2, 0.9, 1.8),
                       c(0.8, 0.6, 0.9, 1.9))
names(novasFlores) <- c("Sepal.Length", "Sepal.Width",  "Petal.Length" ,"Petal.Width")


pred <- predict(model, newdata=novasFlores)

system.time(
for (i in 1:1000000){
  novos <- data.frame(matrix(NA, nrow=0, ncol=4))
  n <- c(runif(1,0,1.5),runif(1,0,1.5),runif(1,0,1.5),runif(1,0,1.5))
  novos <- rbind(novos, n)
  names(novos) <- c('Sepal.Length', 'Sepal.Width',  'Petal.Length' ,'Petal.Width')
  pred <- as.character(predict(model, newdata=novos))
  print(pred)
}
)