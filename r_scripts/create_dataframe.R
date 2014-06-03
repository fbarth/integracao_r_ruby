setwd("~/Documents/integracao_r_ruby/r_scripts")

#
# !!! Evitar este tipo de operacao !!!
#
#m <- matrix(NA, nrow=0, ncol=4)
#for (i in 1:1000000){
#  m <- rbind(m, c(runif(1,0,1.5),runif(1,0,1.5),runif(1,0,1.5),runif(1,0,1.5)))   
#}

# substituir por
m <- do.call("rbind", sapply(1:1000000, FUN = function(i) c(runif(1,0,1.5),runif(1,0,1.5),runif(1,0,1.5),runif(1,0,1.5)), simplify= FALSE))

novos <- data.frame(m)
names(novos) <- c('Sepal.Length', 'Sepal.Width',  'Petal.Length' ,'Petal.Width')
write.csv(novos, file="../data/iris_data.csv", row.names=FALSE)

