# mr_odia/lexer.rb


require_relative 'keywords'

module MrOdia
  class Lexer
    def initialize(input)
      @input = input
      @position = 0
    end

    def next_token
      skip_whitespace
      return [nil, :EOF] if @position >= @input.length

      case @input[@position]
      when '"'
        string_token
      when /[a-zA-Z]/
        identifier_or_keyword_token
      else
        [nil, :UNKNOWN]
      end
    end

    private

    def skip_whitespace
      @position += 1 while @input[@position]&.match?(/\s/)
    end

    def string_token
      start_pos = @position
      advance
      advance until @input[@position] == '"' || @input[@position].nil?
      return [nil, :UNTERMINATED_STRING] if @input[@position].nil?

      value = @input[start_pos + 1...@position]
      advance
      [value, :STRING]
    end

    def identifier_or_keyword_token
      start_pos = @position
      advance while @input[@position]&.match?(/[a-zA-Z]/)

      value = @input[start_pos...@position]
      [value, KEYWORDS[value] || :IDENTIFIER]
    end

    def advance
      @position += 1
    end
  end
end

module MrOdia
  class Lexer
    def initialize(input)
      @input = input
      @position = 0
    end

    def next_token
      skip_whitespace
      return [nil, :EOF] if eof?

      case current_char
      when '"'
        string_token
      when /[a-zA-Z]/
        identifier_or_keyword_token
      when '<', '>', '='
        operator_token
      else
        advance
        [nil, :UNKNOWN]
      end
    end

    private

    def skip_whitespace
      advance while current_char =~ /\s/
    end

    def eof?
      @position >= @input.length
    end

    def current_char
      @input[@position]
    end

    def string_token
      start_pos = @position
      advance # Skip the opening quote
      advance until current_char == '"' || eof?
      return [nil, :UNTERMINATED_STRING] if eof?

      advance # Skip the closing quote
      [@input[start_pos+1...@position], :STRING]
    end

    def identifier_or_keyword_token
      start_pos = @position
      advance while current_char =~ /[a-zA-Z]/
      token = @input[start_pos...@position]
      [token, MrOdia::KEYWORDS[token] || :IDENTIFIER]
    end

    def operator_token
      # Handles multi-character operators first
      if @input[@position, 2] == "=="
        advance; advance
        return ["==", :EQ]
      end
      op = current_char
      advance
      [op, MrOdia::OPERATORS[op]]
    end

    def advance
      @position += 1
    end
  end
end

