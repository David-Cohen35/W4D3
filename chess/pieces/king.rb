require_relative 'stepable'
require_relative 'piece'

class King < Piece
  

    def symbol
        :K
    end

    def move_diffs
        [
            [1,1],
            [-1,-1],
            [1,-1],
            [-1,1],
            [0,1],
            [0,-1],
            [1,0],
            [-1,0]
        ]
    end
end