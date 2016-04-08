class Piece
	attr_accessor :color
	
	def initialize current_position, next_position, color
		@next_position = next_position
		@actual_row = (current_position[1].to_i)
		@actual_column = get_column current_position
		@next_column = get_column next_position
		@next_row = (next_position[1].to_i)
		@color = color
	end

	def get_column coords
 		coords[0].ord - 96
	end

	def movement_rook 
		false
	end

	def movement_bishop 
		false
	end

	def movement_knight 
		false
	end

	def move?
		movement_knight || movement_bishop || movement_knight
	end
end

class King < Piece
	def movement_king 
		dx = (@next_column - @actual_column).abs
    dy = (@next_row - @actual_row).abs
		zero_to_one = 0..1
    if zero_to_one.include?(dx) && zero_to_one.include?(dy)
      return true
    else
      return false
    end
	end

	def move?
		movement_king
	end
end
class Queen < Piece
	def movement_rook
		if @actual_column == @next_column
			true
		elsif @actual_row == @next_row
			true
		else
			false
		end
	end

	def movement_bishop
		dx = (@next_column - @actual_column).abs
    dy = (@next_row - @actual_row).abs

    if dx == dy
      return true
    else
      return false
    end
	end
end
class Bishop < Piece
	def movement_bishop
		dx = (@next_column - @actual_column).abs
    dy = (@next_row - @actual_row).abs
    
    if dx == dy
      return true
    else
      return false
    end
	end
end
class Rook < Piece
	def movement_rook
		if @actual_column == @next_column
			true
		elsif @actual_row == @next_row
			true
		else
			false
		end
	end
end
class Knight < Piece
	def movement_knight
		dx = (@next_column - @actual_column).abs
    dy = (@next_row - @actual_row).abs

    if (dx == 1 && dy == 2) || (dx == 2 && dy == 1)
      return true
    else
      return false
    end
	end
end
class Pawn < Piece
	def initialize current_position, next_position, color
		super
		@first_move = @actual_row == 2 || @actual_row == 7 
	end
	def movement_pawn
		if @first_move 
			if move_two?
				true
			else
				move_one?
			end
		else
			move_one?
		end
	end

	def move_one?
		if @next_row == (@actual_row)+1 || @next_row == (@actual_row)-1 && @actual_column == @next_column
			true
		else
			false
		end
	end

	def move_two?
		if (@next_row == @actual_row+2 || @next_row == @actual_row-2) && @actual_column == @next_column
			true
		else
			false
		end 
	end

	def move?
		movement_pawn
	end

end
