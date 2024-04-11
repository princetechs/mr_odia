=begin
Author: Hello (Sandipparida282@gmail.com)
mr_odia.rb (c) 2024
Desc: description
Created:  2024-04-08T19:11:04.005Z
Modified: !date!
=end

# mr_odia.rb
# lib/mr_odia.rb


require_relative 'mr_odia/keywords'
require_relative 'mr_odia/lexer'
require_relative 'mr_odia/parser'

module MrOdia
  # This module can be extended with additional methods or functionality if needed.
end

# Sample usage, assuming the other files are located in mr_odia/
require_relative 'mr_odia/keywords'
require_relative 'mr_odia/lexer'
require_relative 'mr_odia/parser'

# Example usage:
input = 'dekha "Hello, world!"'
parser = MrOdia::Parser.new(input)
parser.parse




  
  
  