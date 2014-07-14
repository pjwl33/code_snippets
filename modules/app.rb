require 'pry'
require_relative './test_module.rb'
require_relative './beep_module.rb'
require_relative './karma.rb'
require_relative './math.rb'
require_relative './omdb_api.rb'

TestModule.greeting
#  '.' for methods in modules, :: for classes within modules

puts "Size of universe == #{TestModule::SIZE_OF_UNIVERSE}"

TestModule::Cat.new

# Mixins - take other module's methods and put them here
class Toaster
  include BeepModule
  # difference between 'include' & 'extend' is include == instance methods for methods, extend == class methods
end

class Forklift
  extend BeepModule
end

toasty = Toaster.new
toasty.beep
Forklift.beep

Karma.good(32)
Karma.sin(124)

Math.sin(123)
Math.cos(123)

BeepModule.check("paul@gmail.com")

# OMDB.movie_by_title("Toy Story")
# OMDB.search("Toy Story")