require 'spec_helper'
require_relative '../library/tictactoe.rb'

describe 'TicTacToe' do
  it 'should assign tokens to players' do
    game = TicTacToe.new(:X, :O)
    # TicTacToe.new.assign(:X, :O)
    expect(game.token1).to be(:X)
    expect(game.token2).to be(:O)
    # expect(game.assign).to be(:X, :O)
  end

  it 'should not allow tokens to be same' do
    # expect {game = TicTacToe.new(:X, :X)}.to raise_error("Tokens cannot be the same.")
  end

  it 'should allow placing a token in a cell' do
    
  end
  it 'should not allow placing token in a occupied cell'
  it 'should alternate between players'
  it 'should not allow a player to play twice'
  it 'should not allow player 2 to play first'

  context 'Win Scenarios' do
    it 'should declare winner when 3 of his tokens are placed horizontally'
    it 'should declare winner when 3 of his tokens are placed vertically'
    it 'should declare winner when 3 of his tokens are placed diagonally'
  end

  context 'Draw Scenario' do
    it 'should declare draw when there are no free cells and there is no winner'
  end

end

# describe "TicTacToe" do
#   context "The game" do
#     it "should have 2 distinct tokens"do
#       $player1 = 
#       $player2 = 
#   end
#     it "token should get a position in the board" do
#       # TicTacToe.new.place(1,2)
#       # excpect(TicTacToe.new.position[1][2]).to eq(:player1)
#     end
#     it "should play in pim pom manner"
#     it "token positions should be unique"
#   end
#   context "winner" do
#     it "should declare winner if aligned horiontally"
#     it "should declare winner if aligned vertically"
#     it "should declare winner if aligned diagonally"
#   end
#   it "should declare draw if every cells occupied with no winner"
# end