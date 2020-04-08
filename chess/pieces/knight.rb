require_relative 'stepable'
require_relative 'piece'

class Knight < Piece

    def symbol
        :KT
    end

    def move_diffs
        [
        [2,-1], 
        [2, 1], 
        [-2, 1], 
        [-2, -1], 
        [1, 2], 
        [1, -2], 
        [-1, -2], 
        [-1, 2]
    ] 
    end
end

