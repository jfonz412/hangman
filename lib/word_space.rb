class WordSpace
  def initialize(word)
  	@hidden_word = hide_word(word)
  end

  public
  def draw_self(letter, index, is_correct)
  	@hidden_word[index] = letter if is_correct == true
    print @hidden_word
    print "\n"
    print "\n"
  end

  private
  def hide_word(word)
    hidden_word = []
    word.length.times do
      hidden_word << '_ '
    end
    hidden_word.join
  end

end