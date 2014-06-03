tally = Hash.new(0)
File.open('../data/gettysburg.txt').each_line do |line|
  line.downcase.split(/\W+/).each {|w| tally[w] += 1}
end
total = tally.values.inject { |sum,count| sum + count }
tally.delete_if { |key,count| count < 3 || key.length < 4}

## Make sure you set R to something, then RinRuby won't create a new instance.
R = ""

## Only after you've done that, import the gem.
require 'rinruby'

## Create a new instance with the crappy stuff turned off.
r = RinRuby.new({:interactive=>false,:echo=>false})

r.keys = tally.keys
r.counts = tally.values

r.eval <<EOF
  x11()
  names(counts) <- keys
  barplot(rev(sort(counts)), main= "Frequencia de palavras nao triviais", las=2)
  mtext("Entre as #{total} palavras em Gettysburg Address", 3, 0.45)
  rho <- round(cor(nchar(keys), counts), 4)
EOF

puts "A correlacao entre o tamanho e frequencia das palavras e #{r.rho}"
puts "Aperte alguma tecla para continuar..."
STDIN.gets
