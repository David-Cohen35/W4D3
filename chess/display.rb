require "colorize"
require_relative 'cursor'

class Display
    
    attr_reader :board, :cursor

    def initiliaze(board)
        @board = board
        @cursor = Cursor.new([0,0],board)
    end

    def render 
        system('clear')
        @board.each do |row|
            puts row.join('')
        end
    end

end