# mr_odia/parser.rb

require_relative 'lexer'


module MrOdia
  class Parser
    def initialize(input)
      @lexer = Lexer.new(input)
      @current_token = nil
    end

    def parse
      statements = []
      @current_token = @lexer.next_token
      until @current_token.last == :EOF
        statements << parse_statement
        @current_token = @lexer.next_token
      end
      statements
    end

    private

    def parse_statement
      case @current_token.last
      when :PRINT
        parse_print_statement
      else
        [nil, :UNKNOWN]
      end
    end

    def parse_print_statement
      consume_token(:PRINT)
      value, _ = consume_token(:STRING)
      MrOdia.dekha(value)
      [value, :PRINT]
    end

    def consume_token(expected_type)
      if @current_token.last != expected_type
        raise "Unexpected token: Expected #{expected_type} but got #{@current_token.last}"
      end
      value = @current_token.first
      @current_token = @lexer.next_token
      [value, expected_type]
    end
  end

  def self.dekha(message)
    puts message
  end
end

