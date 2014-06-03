cat ../data/pipe.csv | R --vanilla --slave -e "setwd('/home/fabricio/Documents/integracao_r_ruby/r_scripts'); \
library(randomForest); \
load('../model/modelIrisRandomForest.rda'); \
novos = read.csv(pipe('cat /dev/stdin'), header=FALSE); \
names(novos) <- c('Sepal.Length', 'Sepal.Width',  'Petal.Length' ,'Petal.Width'); \
novos\$pred <- predict(model, newdata=novos); \
write.csv(novos, file='../data/novos.csv');"
