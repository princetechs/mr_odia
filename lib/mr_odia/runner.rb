# lib/mr_odia/runner.rb

require_relative 'lexer'
require_relative 'parser'
require_relative 'translator'

# Read Odia code from a file or directly
odia_code = File.read('path/to/your/odia_file.odia')

# Initialize lexer, parser, and translator
lexer = MrOdia::Lexer.new(odia_code)
parser = MrOdia::Parser.new(lexer)
ast = parser.parse
translator = MrOdia::Translator.new(ast)

# Translate Odia code to Ruby code
ruby_code = translator.translate

# Execute the resulting Ruby code
eval(ruby_code)
