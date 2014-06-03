require "rinruby"

class PredictIris

  attr_accessor :r

  def initialize

    #pacote = "party"
    #model_file = "../model/modelIris.rda"

    pacote = "randomForest"
    model_file = "../model/modelIrisRandomForest.rda"

    @r = RinRuby.new({:interactive=>false,:echo=>false})
    @r.eval <<EOF
      library(#{pacote})
      load('#{model_file}')
EOF
  end

  def plot_modelo
    @r.eval <<EOF
      x11()
      plot(model)
EOF
  end

  def recupera_classe(exemplo)

    @r.eval <<EOF
      novos <- data.frame(matrix(NA, nrow=0, ncol=4))
      n <- c(#{exemplo['Sepal.Length']},#{exemplo['Sepal.Width']},#{exemplo['Petal.Length']},#{exemplo['Petal.Width']})
      novos <- rbind(novos, n)
      names(novos) <- c('Sepal.Length', 'Sepal.Width',  'Petal.Length' ,'Petal.Width')
      pred <- as.character(predict(model, newdata=novos))
EOF
    @r.pred
  end

end
