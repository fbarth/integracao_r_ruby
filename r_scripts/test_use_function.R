#
# Para medir o tempo de processo deste script a partir do ambiente do R
# deve-se executar a seguinte sequencias de comandos:
#
# for(i in 1:10) {print(system.time(source("test_use_function.R")))}
#


setwd("~/Documents/integracao_r_ruby/r_scripts")
library(randomForest)

load("../model/modelIrisRandomForest.rda")

m <- do.call("rbind", sapply(1:1000000, FUN = function(i) c(runif(1,0,1.5),runif(1,0,1.5),runif(1,0,1.5),runif(1,0,1.5)), simplify= FALSE))
novos <- data.frame(m)
names(novos) <- c('Sepal.Length', 'Sepal.Width',  'Petal.Length' ,'Petal.Width')

pred <- as.character(predict(model, newdata=novos))
print(pred)
