module Slideable

    HORIZONTAL_DIRS = [[1,0],[-1,0],[0,1],[0,-1]]
    
    DIAGONAL_DIRS = [[1,1],[1,-1],[-1,1],[-1,-1]]

    def horizontal_dirs 
        HORIZONTAL_DIRS
    end

    def diagonal_dirs
        DIAGONAL_DIRS
    end

    def moves
        moves = []  #[]

        move_dirs.each do |step| 
            pos.first, pos.last = pos  

            first = step.first + pos.first
            last = step.last + pos.last

            new_pos = [first,last] 
        end
        moves
    end
    
    private

    def move_dirs
        raise "I don't know how to move"
    end

    def grow_unblocked_moves_in_dir(dx,dy)
        unblocked_moves = []
        position = self.pos
        new_pos = [position.first + dx, position.last + dy]
        
        while board.valid_pos?(new_pos) && board.empty?(new_pos) && board[new_pos].color != color
            unblocked_moves << new_pos
        end
        unblocked_moves
    end
end