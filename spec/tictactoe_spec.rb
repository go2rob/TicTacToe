RSpec.describe 'TicTacToe' do

  let(:game) { TicTacToe.new(:X, :O) }
  let(:p1x1) { Position.new(0, 0) }
  let(:p1x2) { Position.new(0, 1) }
  let(:p1x3) { Position.new(0, 2) }
  let(:p2x1) { Position.new(1, 0) }
  let(:p2x2) { Position.new(1, 1) }
  let(:p2x3) { Position.new(1, 2) }
  let(:p3x1) { Position.new(2, 0) }
  let(:p3x2) { Position.new(2, 1) }
  let(:p3x3) { Position.new(2, 2) }

  it 'should assign tokens to players' do
    expect(game.token1).to be(:X)
    expect(game.token2).to be(:O)
  end

  it 'should not allow invalid token' do
    expect { game.place(p1x2, :Y) }.to raise_error('Invalid token Y.')
  end

  it 'should not allow tokens to be same' do
    expect {game = TicTacToe.new(:X, :X)}.to raise_error("Tokens cannot be the same.")
  end

  it 'should allow placing a token in a cell' do
    game.place(p1x2, :X)
    expect(game.token_at(p1x2)).to eq(:X)
  end

  it 'should not allow placing token in a occupied cell' do
    game.place(p1x2, :X)
    expect { game.place(p1x2 ,:O) }.to raise_error("This cell is occupied")
  end

  it 'should not allow player 2 to play first' do
    expect { game.place(p1x2, :O) }.to raise_error("Invalid turn.")
  end

  it 'should not allow a player to play twice' do
    game.place(p1x2, :X)
    expect { game.place(p1x3, :X) }.to raise_error("Invalid turn.")
  end

  context 'Win Scenarios' do
    it 'should declare winner when 3 of his tokens are placed horizontally' do
      is_win = false
      game.add_listener { |event| 
        expect(event).to be_a(WinEvent)
        expect(event.winner).to be(:X)
        is_win = true
      }
      game.place(p1x2, :X)
      game.place(p2x2, :O)
      game.place(p1x1, :X)
      game.place(p2x1, :O)
      game.place(p2x3, :X)
      game.place(p3x3, :O)
      game.place(p1x3, :X)

      expect(is_win).to be_truthy
      expect(game.result(:X)).to be(:"X is winner")
    end

    it 'should declare winner whn 3 of his tokens are placed vertically' do
    is_win = false
      game.add_listener { |event| 
        expect(event).to be_a(WinEvent)
        expect(event.winner).to be(:X)
        is_win = true
      }
      game.place(p1x2, :X)
      game.place(p2x2, :O)
      game.place(p1x1, :X)
      game.place(p2x1, :O)
      game.place(p2x3, :X)
      game.place(p3x3, :O)
      game.place(p1x3, :X)

      expect(is_win).to be_truthy
      expect(game.result(:X)).to be(:"X is winner")
    end

    it 'should declare winner when 3 of his tokens are placed diagonally' do
      is_win = false
      game.add_listener { |event| 
        expect(event).to be_a(WinEvent)
        expect(event.winner).to be(:X)
        is_win = true
      }
      game.place(p2x2, :X)
      game.place(p1x2, :O)
      game.place(p1x1, :X)
      game.place(p2x1, :O)
      game.place(p3x3, :X)

      expect(is_win).to be_truthy
      expect(game.result(:X)).to be(:"X is winner")
    end
  end

  context 'Draw Scenario' do
    
    it 'should declare draw when there are no free cells and there is no winner' do
      is_draw = false
      game.add_listener { |event|
        expect(event).to be_a(DrawEvent)
        is_draw = true  
      }
      game.place(p2x2, :X)
      game.place(p1x2, :O)
      game.place(p1x1, :X)
      game.place(p3x3, :O)
      game.place(p2x1, :X)
      game.place(p3x1, :O)
      game.place(p3x2, :X)
      game.place(p2x3, :O)
      game.place(p1x3, :X)
     
      expect(is_draw).to be_truthy
      expect(game.result(:X)).to be(:"Match is draw")
    end
  end
end