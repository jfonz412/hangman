class Dump
  def initialize
  	@wrong_letters = []
  end
  
  public
  def draw_self(letter, index, is_correct)
  	@wrong_letters << letter if is_correct == false
  	puts "Wrong letters: #{@wrong_letters.join(", ")}"
  end
end
