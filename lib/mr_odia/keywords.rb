# mr_odia/keywords.rb

module MrOdia
  KEYWORDS = {
    'khela' => :FUNCTION,
    'asila' => :BEGIN,
    'jadi' => :IF,
    'nahele' => :ELSE,
    'nahale nai' => :ELIF,
    'tikehau' => :LOOP,
    'sarila' => :END,
    'jamaa' => :BREAK,
    'sata' => :TRUE,
    'micha' => :FALSE,
    'nanhi' => :NIL,
    'tebe' => :THEN,
    'dekha' => :PRINT  # New keyword for print
  }.freeze
  OPERATORS = {
    '<' => :LT,
    '>' => :GT,
    '==' => :EQ,
    # Add more operators as needed
  }.freeze
end

  