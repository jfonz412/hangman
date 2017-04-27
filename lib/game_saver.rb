class GameSaver
  def initialize(game_objects)
    @game_objects = game_objects
  end

  def save_game
  	puts "Saving the game..."
    @game_save = YAML.dump(@game_objects)

    f = File.open("save_game1.yaml", 'w')
    f.write(@game_save)
    puts "Done!"
  end
end