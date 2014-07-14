require_relative './stuff'
require 'active_support/all'

class Reader
  include Stuff
end

r = Reader.new
r.name_of_stuff
r.transfer("my house")
puts Reader.ancestors
puts Reader.included_modules
Stuff.get_stuff("Paul")
Reader::StuffClass.new