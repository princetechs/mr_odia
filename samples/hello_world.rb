# samples/examples/hello_world.rb

require_relative '../lib/mr_odia/parser'
require_relative '../lib/mr_odia/lexer'
require_relative '../lib/mr_odia/keywords'

# Assume these additional lines are at the bottom of your `mr_odia.rb` or in `run_odia.rb`
input = <<~MR_ODIA
  jadi "5" < "0" tebe
    dekha "The number is positive."
  nahele jadi "5" < "0" tebe
    dekha "The number is negative."
  nahele
    dekha "The number is zero."
MR_ODIA

parser = MrOdia::Parser.new(input)
parser.parse



