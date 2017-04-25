class Board
  def initialize(board_objects)
  	@board_objects = board_objects
  end

  def draw_board_objects(results)
  	@board_objects.each do |key,object|
  	  object.draw_self(results)
  	end
  end
end