class Piece

    attr_reader :color,:board
    attr_accessor :position

    def initialize(color,board,position)
        @color = color
        @board = board
        @position = position
    end
    
    def empty?
        false
    end

    def to_s
        "#{symbol}"
    end

    def valid_moves
        valids = []
        moves.each {|move| valids << move unless move_into_check?(move) }
        valids
    end

    private

    def move_into_check?(end_pos)
        dup_board = board.dup
        dup_board.move_piece!(color,start_pos,end_pos)
        # dup_board.flatten.each {|piece| return true if piece.moves.include?(end_pos) && self.color != piece.color }
        # false
    end

end