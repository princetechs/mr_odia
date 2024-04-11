# mr_odia/parser.rb

require_relative 'lexer'

module MrOdia
  class Parser
    def initialize(input)
      @lexer = Lexer.new(input)
      @current_token = nil
    end

    def parse
      until @current_token&.last == :EOF
        @current_token = @lexer.next_token
        statement = parse_statement
      end
    end

    private

    def parse_statement
      statement_parser = {
        PRINT: method(:parse_print_statement),
        IF: method(:parse_if_statement)
      }

      parser = statement_parser[@current_token&.last] || method(:parse_unknown_statement)
      parser.call
    end

    def parse_print_statement
      consume_token(:PRINT)
      value, _ = consume_token(:STRING)
      MrOdia.dekha(value)
      [value, :PRINT]
    end

    def parse_if_statement
      consume_token(:IF)
      condition = parse_expression
      consume_token(:THEN)
      true_branch = parse_block
      false_branch = nil

      if peek_token&.last == :ELSE
        consume_token(:ELSE)
        false_branch = parse_block
      end

      { type: 'if', condition: condition, true_branch: true_branch, false_branch: false_branch }
    end

    def parse_expression
      # Implement the expression parsing logic for your Odia language
    end

    def parse_block
      # Implement the block parsing logic for your Odia language
    end

    def parse_unknown_statement
      [nil, :UNKNOWN]
    end

    def consume_token(expected_type)
      if @current_token&.last != expected_type
        raise "Unexpected token: Expected #{expected_type} but got #{@current_token&.last}"
      end

      value = @current_token&.first
      @current_token = @lexer.next_token
      [value, expected_type]
    end

    def peek_token
      @lexer.peek_token
    end
  end

  def self.dekha(message)
    puts message
  end
end
