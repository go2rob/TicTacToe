class TicTacToe
  attr_accessor :token1, :token2, :board
 
  def initialize(token1, token2)
    raise "Tokens cannot be the same." if token1 == token2     
    @token1 = token1
    @token2 = token2
    @board = Array.new(3) { Array.new(3) }
    @current_token = nil
  end

  def place(position, token)
    raise "Invalid token #{token}." if([@token1, @token2].none? {|t| token == t })
    raise "Invalid turn." if(@current_token.nil? && token != token1)
    raise "Invalid turn." if (@current_token == token)
    raise "This cell is occupied" unless(@board[position.x][position.y].nil?)

    @board[position.x][position.y] = token
    @current_token = token
    check_for_linear_win(@board) || check_for_linear_win(@board.transpose)
    check_for_diagonal_win(@board) || check_for_diagonal_win(@board.reverse)  
    check_for_draw(@board)

  end
  
  def token_at(position)
    @board[position.x][position.y]
  end

  def add_listener(&observer)
    @observer = observer
  end

  def result(token)
    if(check_for_draw(@board))
      :"Match is draw" 
    else
    :"#{token} is winner" #if(check_for_linear_win(@board) || check_for_linear_win(@board.transpose) || check_for_diagonal_win(@board) || check_for_diagonal_win(@board.reverse))
  end
  end

  private

  def check_for_linear_win(board)
    is_win = board.any? { |row| row.all? { |t| @current_token == t }}
    @observer.call(WinEvent.new(@current_token)) if(is_win)

  end

  def check_for_diagonal_win(board)

    is_win = board.each_with_index.map { |row, index| row[index] if(@current_token ==  row[index]) }.all?
    @observer.call(WinEvent.new(@current_token)) if(is_win)
  end

  def check_for_draw(board)
    is_occupied = board.all?{ |row| row.all? }
    if(is_occupied && !check_for_linear_win(board) && !check_for_diagonal_win(board))
      @observer.call(DrawEvent.new(@board))
    end
  end 
end

class WinEvent
  def initialize(winner) @winner = winner; end
  attr_reader :winner
end

class DrawEvent
  def initialize(draw)
    @draw = draw
  end
  attr_reader :draw
end