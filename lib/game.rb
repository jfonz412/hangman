require './lib/word_picker.rb'
require './lib/word_space.rb'
require './lib/gallows.rb'
require './lib/dump.rb'
require './lib/board.rb'
require './lib/game_master.rb'

puts "Hangman Initialized"

#SELECT RANDOM WORD FROM DICTIONARY
randomized_word = WordPicker.new
the_secret_word = randomized_word.word

#BOARD AND BOARD SECTIONS
secret_word_space = WordSpace.new(the_secret_word)
hanging_man = Gallows.new
letter_dump = Dump.new

# CREATE BOARD OBJECT HASH TO EASILY PASS OBJECTS TO BOARD
board_objects = {
	hanging_man: hanging_man,
	secret_word_space: secret_word_space,
	letter_dump: letter_dump
}
game_board = Board.new(board_objects)

#DRAW INITIAL GAME BOARD
game_board.draw_board_objects(nil, nil, nil)
# (TEST) UPDATE BOARD
game_board.draw_board_objects('b', nil, false)
game_board.draw_board_objects('c', 2, true)
