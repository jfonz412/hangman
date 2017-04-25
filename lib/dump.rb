class Dump
  attr_reader :wrong_letters
  def initialize
  	@wrong_letters = []
  end
  
  public
  def draw_self(results)
  	if results[:letter] != nil
  	  @wrong_letters << results[:letter] if results[:is_correct] == false
  	  puts "Wrong letters: #{@wrong_letters.join(", ")}"
  	end
  end
end
