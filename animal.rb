require 'pry'

class Animal
  attr_accessor :name, :year, :species, :origin, :location

  def initialize(name, options={})
    @name = name
    @year = Time.now.year
    @species, @origin, @location = options[:species], options[:origin], options[:location]
  end
end

class Cat < Animal
  attr_accessor :color, :owner, :home

  def initialize(name, options={})
    super(name, options)
    @color, @owner, @home = options[:color], options[:owner], options[:home]
  end

  def judge_person(person)
    puts "#{self} is judging #{person} so hard right now"
  end

  def to_s
    self.name
  end
end

options = {
  species: "Feline Major",
  location: "Brooklyn",
  origin: "North America",
  color: "Tiger-striped",
  owner: "The Bottega Guys",
  home: "The Bottega"
}
cat = Cat.new("Fika", options)
puts cat, cat.name, cat.owner, cat.home, cat.species, cat.color, cat.origin, cat.year
cat.judge_person('Paul Lee')

binding.pry