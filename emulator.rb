class Emulator
  def initialize(system)
    # Creates an emulator for the given system
  end

  def play(game)
    # Runs the given game in the emulator - CAN'T HAVE self here because then it's an instance of the Emulator class, not the Gmae class. That's why we are passing in the self game object as the game argument
    puts "PLAYING: #{game.name} from #{game.year} on the #{game.system} system"
  end

  def start(game)
    # Loads the given game but doesn't run it
    puts "STARTING: #{game.name} from #{game.year} on the #{game.system} system"
  end

  def screenshot
    # Returns a screenshot of the currently loaded game
    puts "Screenshotted!"
  end
end
