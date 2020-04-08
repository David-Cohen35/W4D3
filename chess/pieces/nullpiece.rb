require 'singleton'

class NullPiece
    include Singleton

    attr_reader :color, :symbol
   
    def initialize      
        @color = nil
        @symbol = ""
    end

    def empty?
        true
    end

end