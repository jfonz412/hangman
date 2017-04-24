class Board
  def initialize(board_objects)
  	@board_objects = board_objects
  end

  def draw_board_objects(letter, index, is_correct)
  	@board_objects.each do |key,object|
  	  object.draw_self(letter, index, is_correct)
  	end
  end
end