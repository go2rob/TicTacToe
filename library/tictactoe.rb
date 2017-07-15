require 'byebug'
class TicTacToe
  attr_accessor :token1, :token2, :board
 
  def initialize(token1, token2)
    raise "Tokens cannot be the same." if token1 == token2     
    @token1 = token1
    @token2 = token2
    @board = Array.new(3) { Array.new(3) }
  end

  def place(x, y, z)
    if @board[x][y] == nil
      @board[x][y] = z
    else
     raise "This cell is occupied"
    end
  end
  def return_element(x, y)
    @board[x][y]
  end
end       
# class PlayingPart < TicTacToe
#   attr_accessor :board
#   def place(x, y, z)
#     @board[x][y] = z
#   end
# end