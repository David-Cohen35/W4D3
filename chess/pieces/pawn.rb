require_relative 'piece'

class Pawn < Piece
    
    def symbol
        :P
    end

    def moves
        forward_steps + side_attacks
    end

    private

    def at_start_row?
        return true if color == :white && pos[row] == 1
        return true if color == :black && pos[row] == 6
        false
    end

    def forward_dir
        if color == :white
            -1
        else
            1
        end
    end

    def forward_steps
        possible_steps = []
        row,col = pos

        step = [row + forward_dir,col]
        possible_steps << step if board.valid_pos?(step) && board.empty?(step) || board[step].color != color

        two_step = [row + 2,col]
        possible_steps << two_step if board.valid_pos?(two_step) && board.empty?(two_step) && at_start_row?

        possible_steps
    end

    def side_attacks
        row, col = pos
        diag_steps = [[row + forward_dir,col - 1],[[row + forward_dir,col + 1]]]
        possible_attack = []

        diag_steps.each do |diag_step|
            possible_attack << diag_step if board.valid_pos?(diag_step) && board[diag_step].color != color
        end
        
        possible_attack
    end
end