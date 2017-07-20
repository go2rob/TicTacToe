Dir["#{Dir.pwd}/lib/*"].each {|f| require f }


class Console

  def initialize
    @game = TicTacToe.new(:X, :O)
    @winner = false
    @draw = false
    @game.add_listener { |event|
      print_board
      if(event.is_a?(WinEvent))
        puts "Player #{event.winner} has won!"
        @winner = event.winner
      elsif(event.is_a?(DrawEvent))
        puts "Game is a draw."
        @draw = true
      end
    }
  end

  def completed?
    @winner || @draw
  end

  def run
    puts "Player 1: X, Player 2: O"

    current_player = :X
    while(not completed?)
      begin
        print_board
        print "Player #{current_player} turn. Enter x, y: "
        values = gets
        split_values = values.chomp.split(/[\s,]+/)
        raise "Invalid input #{split_values}" if(split_values.count != 2)
        x = split_values[0].strip.to_i
        y = split_values[1].strip.to_i
        @game.place(Position.new(x, y), current_player)
        current_player = (current_player == :X ? :O : :X)
      rescue StandardError => e
        puts e.message
      end
    end
  end

  private
  def print_board
    print_line
    print_cell(0)
    print_line
    print_cell(1)
    print_line
    print_cell(2)
    print_line
  end

  def print_cell(x)
    values = [Position.new(x, 0), Position.new(x, 1), Position.new(x, 2)].map { |p|
      token = @game.token_at(p)
      token.nil? ? "   " : " #{token.to_s} "
    }
    puts "|#{values.join('|')}|"
  end

  def print_line
    puts '-------------'
  end

end



Console.new.run