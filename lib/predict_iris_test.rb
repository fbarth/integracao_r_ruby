
require_relative "predict_iris"

pred = PredictIris.new

#pred.plot_modelo
#puts "Aperte alguma tecla para continuar..."
#STDIN.gets

# novo exemplo a ser classificado

puts "\n\n\n"

t1 = Time.new
novo = Hash.new
10000.times do
  novo["Sepal.Length"] = rand(0..1.5)
  novo["Sepal.Width"] = rand(0..1.5)
  novo["Petal.Length"] = rand(0..1.5)
  novo["Petal.Width"] = rand(0..1.5)

  #puts novo
  #puts pred.recupera_classe(novo)
  pred.recupera_classe(novo)
end
puts "Tempo de processamento = #{Time.new - t1}"
