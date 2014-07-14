require_relative "./emulator.rb"

class Game
  attr_accessor :name, :year, :system
  attr_reader :created_at

  def initialize(name, options={})
    self.name = name
    self.year = options[:year]
    self.system = options[:system]
    @created_at = Time.now
  end

  def play
    emulate { |emulator| emulator.play(self) }
  end

  def screenshot
    emulate { |emulator| emulator.screenshot }
  end

  private
  def emulate
    begin
      emulator = Emulator.new(system)
      emulator.start(self)
      yield emulator
    rescue Exception => e
      puts "Emulator failed: #{e}"
    end
  end
end

g = Game.new("Bug", {year: 1995, system: "Sega Saturn"})
g.play
g.screenshot