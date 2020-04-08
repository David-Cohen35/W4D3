require_relative "pieces"
require_relative "display"

class Board
    
    attr_accessor :board

    def initialize
        @board = Array.new(8) {Array.new(8)}
        @sentinel = NullPiece.instance
        populate_board
    end

    def populate_board
        (0..7).each do |row|
            (0..7).each do |col|
                if row == 1
                    @board[row][col] = Pawn.new(:white,board,[row,col])
                elsif row == 6
                    @board[row][col] = Pawn.new(:black,board,[row,col])
                elsif row == 0 && (col == 0 || col == 7)
                    @board[row][col] = Rook.new(:white,board,[row,col])
                elsif row == 7 && (col == 0 || col == 7)
                    @board[row][col] = Rook.new(:black,board,[row,col])
                elsif row == 0 && (col == 1 || col == 6)
                    @board[row][col] = Knight.new(:white,board,[row,col])
                elsif row == 7 && (col == 1 || col == 6)
                    @board[row][col] = Knight.new(:black,board,[row,col])
                elsif row == 0 && (col == 2 || col == 5)
                    @board[row][col] = Bishop.new(:white,board,[row,col])
                elsif row == 7 && (col == 2 || col == 5)
                    @board[row][col] = Bishop.new(:black,board,[row,col])
                elsif row == 0 && col == 3
                    @board[row][col] = Queen.new(:white,board,[row,col])
                elsif row == 7 && col == 3
                    @board[row][col] = Queen.new(:black,board,[row,col])
                elsif row == 0 && col == 4 
                    @board[row][col] = King.new(:white,board,[row,col])
                elsif row == 7 && col == 4 
                    @board[row][col] = King.new(:black,board,[row,col])
                else
                    @board[row][col] = @sentinel
                end
            end
        end
    end

    def in_check?(color)
        king_pos = find_king(color)
        @board.flatten.each { |piece| return true if piece.color != color && piece.moves.include?(king_pos) }
        false
    end

    def checkmate?(color)

        return false unless in_check?(color)

        @board.flatten.each do |piece| 
            King.color.moves.each do |move|
                return false unless piece.color != color && piece.moves.include?(move)
            end
        end
        
        @board.flatten.each do |piece|
            return false unless piece.color == color && piece.valid_moves.empty?
        end
        
        true
    end

    def [](pos)
        row, col = pos
        @board[row][col]
    end

    def []=(pos,value)
        row, col = pos
        @board[row][col] = value
    end

    def valid_pos?(pos)
        return true if (pos[0] >= 0 && pos[0] < 8) && (pos[1] >= 0 && pos[1] < 8) && pos.length == 2
        false
    end

    def add_piece(piece,pos)  
        self[pos.first][pos.last] = piece if self.valid_pos?(pos)
    end


    def move_piece(color,start_pos,end_pos) # add color component
        if start_pos.empty?
            raise "starting position is empty"
        elsif !valid_pos?(end_pos)
            raise "invalid position"
        elsif !self.valid_moves.include?(end_pos)
            raise "this move will make you lose"
         end
    end

    def find_king(color)
        (0..7).each do |row_idx|
            (0..7).each do |piece_idx|
                piece = @board[row_idx][piece_idx]
                return [row_idx,piece_idx] if piece.is_a?(King) && piece.color == color
            end
        end
    end

    def dup
        dup = Array.new(8) {Array.new(8)}
        (0..7).each do |row_idx|
            (0..7).each do |piece_idx|
                dup[row_idx][piece_idx] = @board[row_idx][piece_idx]
            end
        end
        dup
    end

    def move_piece!(color,start_pos,end_pos)
        piece = self[start_pos]

        if piece.move.include?(end_pos)
            raise "Can't move there"
        end
        
        self[end_pos] = piece
        self[start_pos] = @sentinel
        self[end_pos].position = end_pos
    end

end



