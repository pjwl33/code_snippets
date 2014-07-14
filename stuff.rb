require 'active_support/all'

module Stuff
  # extend ActiveSupport::Concern

  def self.included(base)
    base.extend(StuffMethods)
  end

  def name_of_stuff
    puts "This is my name"
  end

  def transfer(location)
    puts "I'm transferring to #{location}"
  end

  module StuffMethods
    def get_stuff(name)
      puts "Getting #{name}!"
    end
  end

  class StuffClass
    def initialize
      puts "I'm a stuff class!"
    end
  end
end

# module StuffProcessing
#   extend ActiveSupport::Concern
#   include Stuff
#   included do
#     get_stuff
#   end

# end