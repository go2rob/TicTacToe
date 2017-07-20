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
    unless(@game_completed)
      raise "Invalid token #{token}." if([@token1, @token2].none? {|t| token == t })
      raise "Invalid placement." if(position < Position.new(0, 0) || position > Position.new(2, 2))
      raise "Invalid turn." if(@current_token.nil? && token != token1)
      raise "Invalid turn." if(@current_token == token)
      raise "This cell is occupied" unless(@board[position.x][position.y].nil?)
      @board[position.x][position.y] = token
      @current_token = token
    end
    @game_completed = check_for_win || check_for_draw
  end
  
  def token_at(position)
    @board[position.x][position.y]
  end

  def add_listener(&observer)
    @observer = observer
  end

  private
  def check_for_win
    check_for_linear_win || check_for_diagonal_win
  end

  def check_for_linear_win
    is_win = @board.any? { |row| row.all? { |t| @current_token == t }}
    is_win ||= @board.transpose.any? { |row| row.all? { |t| @current_token == t }}
    @observer.call(WinEvent.new(@current_token)) if(is_win)
    is_win
  end

  def check_for_diagonal_win
    is_win = @board.each_with_index.map { |row, index| row[index] if(@current_token ==  row[index]) }.all?
    is_win ||= @board.reverse.each_with_index.map { |row, index| row[index] if(@current_token ==  row[index]) }.all?

    @observer.call(WinEvent.new(@current_token)) if(is_win)
    is_win
  end

  def check_for_draw
    is_occupied = @board.all?{ |row| row.all? }
    if(is_occupied && !check_for_win)
      @observer.call(DrawEvent.new())
      true
    else
      false
    end
  end 
end

class WinEvent
  def initialize(winner) @winner = winner; end
  attr_reader :winner
end

class DrawEvent

end