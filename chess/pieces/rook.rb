require_relative 'slideable'
require_relative 'piece'

class Rook < Piece 
    include Slideable
    def symbol
        :R
    end
    
    protected
    def move_dirs
        horizontal_dirs
    end
end