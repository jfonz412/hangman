require './lib/word_picker.rb'
require './lib/word_space.rb'
require './lib/gallows.rb'
require './lib/dump.rb'
require './lib/board.rb'
require './lib/gamemaster.rb'
require './lib/player.rb'
require './lib/game_saver.rb'
require './lib/game_loader.rb'
require 'yaml'

puts "\n"
puts "WELCOME TO HANGMAN!!!"

# ----------------LOAD OLD GAME OBJECTS-------------------
game_loader = GameLoader.new

# ----------------CREATE (NEW)GAME OBJECTS----------------
randomized_word = WordPicker.new
the_secret_word = randomized_word.word.downcase #ensure case insensativity
game_master = GameMaster.new(the_secret_word)

# board-objects
secret_word_space = WordSpace.new(the_secret_word)
hanging_man = Gallows.new
letter_dump = Dump.new

player = Player.new

game_objects = {
  game_master: game_master,
  player: player,
  hanging_man: hanging_man,
  secret_word_space: secret_word_space,
  letter_dump: letter_dump
}

game_objects = game_loader.loaded_game if game_loader.loaded_game != nil

game_board = Board.new(game_objects)
game_saver = GameSaver.new(game_objects)

# ---------------GAME STARTS HERE--------------------
# draw initial game board
game_board.draw_board_objects(game_master.results)

# game loop
loop do 
  player.pick_a_letter
  
  if player.chosen_letter == "save"
  	game_saver.save_game
  	break
  end

  game_master.check_player_letter(player.chosen_letter)
  game_board.draw_board_objects(game_master.results)

  if secret_word_space.check_for_win == true
  	puts "\nYou win!!!"
  	break
  end

  if hanging_man.turns == 6
    puts "Sorry, game over..."
    puts "The secret word was \"#{the_secret_word}\""
    break
  end

end


