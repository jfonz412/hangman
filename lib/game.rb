require './lib/word_picker.rb'
require './lib/word_space.rb'
require './lib/gallows.rb'
require './lib/dump.rb'
require './lib/board.rb'
require './lib/gamemaster.rb'
require './lib/player.rb'

puts "WELCOME TO HANGMAN!!!"

# ----------------LOAD OLD GAME OBJECTS-------------------
=begin
	objects, if not named by default when loaded, should be renamed the exact
	same names as they are below to ensure the game loop works
=end

# ----------------CREATE (NEW)GAME OBJECTS----------------
# get random word from dictionary
randomized_word = WordPicker.new
the_secret_word = randomized_word.word.downcase #ensure case insensativity
game_master = GameMaster.new(the_secret_word)

# board-objects
secret_word_space = WordSpace.new(the_secret_word)
hanging_man = Gallows.new
letter_dump = Dump.new

player = Player.new

# hash to hold board objects, to be passed to board
board_objects = {
	hanging_man: hanging_man,
	secret_word_space: secret_word_space,
	letter_dump: letter_dump
}
game_board = Board.new(board_objects)

# --PASS BOARD OBJECTS HASH + PLAYER TO SAVE OBJECT--



# ---------------GAME STARTS HERE--------------------
# draw initial game board
game_board.draw_board_objects(game_master.results)

# game loop
loop do 
  player.pick_a_letter
  game_master.check_player_letter(player.chosen_letter)
  game_board.draw_board_objects(game_master.results)

  if secret_word_space.check_for_win == true
  	puts "\nYou win!!!"
  	break
  end

  if hanging_man.turns == 6
    puts "Sorry, game over..."
    break
  end

end


