class Panda
  attr_accessor :name, :home, :status

  def initialize name, home
    @name, @home = name, home
  end

  statuses = [:sleeping, :snoring, :awake, :tired, :ready_to_play]
  statuses.each do |status|
    define_method status do @status = status end
  end

  def be_lazy
    puts "no FOMO today...yawnnnn..."
  end

  def eating(food)
    puts "Eating #{food} - nom nom nom..."
  end

  # attr_reader :house
  # alias_method :house, :home
  alias_method :sleep, :be_lazy

    # now you should be able to call panda.sleeping, panda.snoring, etc. to set its status
end

class PandaSleepStatus < Panda
  def be_lazy
    check_status
    super
  end

  def check_status
  end
end

panda = Panda.new("Paul", "Brooklyn")
puts panda.name
puts panda.home
# panda.sleep
# panda.be_lazy

panda.sleeping
puts panda.status
panda.awake
puts panda.status

be_lazy_method = panda.method :be_lazy
be_lazy_method.call
eating_method = panda.method :eating
["bamboo", "cheese", "grass"].each(&eating_method)


Cat = Struct.new :name, :color do
  def introduce
    puts "#{name}, the #{color}-colored kitty"
  end
end
# used for classes that are simply attributes
cat = Cat.new("Ginger", "orange/brown/white")
cat.introduce

class Library
  attr_accessor :games

  def initialize(games)
    @games = games
  end
  method_types = [:each, :map, :select]
  method_types.each do |m|
    define_method m do |&block|
      games.send m, &block
    end
  end
end

games = ["Battlefront 2", "Bioshock", "God of War"]
lib = Library.new(games)
lib.each { |game| puts game}
lib.map { |game| puts game}
lib.select { |game| puts game}