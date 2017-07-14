require 'spec_helper'
require_relative '../library/tictactoe.rb'

describe "TicTacToe" do

	it "should make the board"do

	end
	context "The game" do
		it "should have 2 distinct tokens"
		it "token should get a position in the board"
		it "should play in pim pom manner"
		it "token positions should be unique"
	end
	context "winner" do
		it "declare winner if aligned horiontally"
		it "declare winner if aligned vertically"
		it "declare winner if aligned diagonally"
	end
	it "declare draw if every cells occupied with no winner"
end
#trial