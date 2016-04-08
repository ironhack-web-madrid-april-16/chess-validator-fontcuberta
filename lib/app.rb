require 'pry'
require_relative 'piece'

class Chess
	def initialize
		@all_positions = IO.readlines('../simple_board.txt')
		binding.pry
		@board = {}
		@selected_piece = ""
		create_all_board @all_positions
		test_all_moves
	end

	def test_all_moves
		all_moves = IO.readlines("../simple_moves.txt")

		all_moves.each do |move|
			origin, destination = move.split(" ")
			make_a_move origin, destination
		end
	end

	def make_a_move origin, destination
		identify_piece origin, destination
		if @selected_piece.move?
			 puts check_if_empty(destination)
		else
			puts false
		end
	end

	def create_all_board all_positions
		@board[:a] = all_positions[0].split(" ")
		@board[:b] = all_positions[1].split(" ")
		@board[:c] = all_positions[2].split(" ")
		@board[:d] = all_positions[3].split(" ")
		@board[:e] = all_positions[4].split(" ")
		@board[:f] = all_positions[5].split(" ")
		@board[:g] = all_positions[6].split(" ")
		@board[:h] = all_positions[7].split(" ")
	end

	def identify_piece origin, destination
		piece = @board[origin[0].to_sym][origin[1].to_i - 1]

		case piece[1]
			when "Q"
				@selected_piece = Queen.new origin, destination, piece[0]
			when "K"
				@selected_piece = King.new origin, destination, piece[0]
			when "R"
				@selected_piece = Rook.new origin, destination, piece[0]
			when "B"
				@selected_piece = Bishop.new origin, destination, piece[0]
			when "N"
				@selected_piece = Knight.new origin, destination, piece[0]
			when "P"
				@selected_piece = Pawn.new origin, destination, piece[0]
			else
				@selected_piece = Piece.new origin, destination, piece[0]
		end
	end

	def check_if_empty position
		square = @board[position[0].to_sym][position[1].to_i - 1]
		square == "--" || square[0] != @selected_piece.color

	end

end

b = Chess.new