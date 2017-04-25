class GameMaster
  attr_reader :results

  def initialize(the_secret_word)
  	@secret_word = the_secret_word
    @results = {
  	  letter: nil,
  	  indexes: [],
  	  is_correct: false
  	}
  end

  public
  def check_player_letter(player_letter)
  	# Has to be reset everytime
    @results = {
  	  letter: player_letter,
  	  indexes: [],
  	  is_correct: false
  	}
    
    # IS PLAYER TRYING TO SAVE?

  	@secret_word.split('').each_with_index do |secret_letter,secret_index|
  	  if secret_letter == player_letter
        @results[:indexes] << secret_index
        @results[:is_correct] = true
  	  end
  	end
  end

end