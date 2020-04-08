module Stepable 
    
    def moves
        moves = []

        move_diffs.each do |step|
            pos.first, pos.last = pos

            first = step.first + pos.first
            last = step.last + pos.last

            new_pos = [first,last]

            if board.valid_pos?(new_pos) && board.empty?(new_pos) && board[new_pos].color != color
                moves << new_pos
            end
        end
        moves
    end

    private

    def move_diffs
        raise "I don't know hot to move"
    end
end