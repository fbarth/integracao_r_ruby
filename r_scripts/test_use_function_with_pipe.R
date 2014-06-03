setwd("/home/fabricio/Documents/integracao_r_ruby/r_scripts")
library(randomForest)

load("../model/modelIrisRandomForest.rda")

# lendo de um pipe
# pipe.csv foi criado com mkfifo
# para testar cat iris_data_sem_header.csv > pipe.csv
#
novos <- read.csv("../data/pipe.csv", header=FALSE)
#novos <- read.csv("../data/iris_data_sem_header.csv", header=FALSE)
names(novos) <- c('Sepal.Length', 'Sepal.Width',  'Petal.Length' ,'Petal.Width')

novos$pred <- as.character(predict(model, newdata=novos))
write.csv(novos, file="../data/novos.csv")
#print(novos)
