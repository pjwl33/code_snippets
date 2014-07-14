require 'delegate' #automatically delegate all method calls to local object unless delcared locally

class School < SimpleDelegator
  DELEGATED_METHODS = [:username, :avatar]
  def initialize user
    super user
  end

  def method_missing method_name, *args
    if DELEGATED_METHODS.include?(method_name) #to check if the delegated and included methods have this name
      @user.send method_name, *args
    else
      super #default handling for all other methods
    end
  end

end

class Country
  def initialize name
    @nmae = name
  end

  def to_s
    @name
  end

  def method_missing method_name, *args
    # + in regex means one or more times, * is zero or more times, {n, } n or more times, {, m} m or less times, {n, m} at least n, less than m
    match = method_name.to_s.match(/^hash_(\w+)/)
    if match
      @name << "##{match[1]}"
    else
      super
    end
  end

  def respond_to? method_name
    # this operator will return 0 or nil if it works or not, for example: used with assigning varialbes with regex: /(?<a>\w+)\s*@\s*(?<b>\w+)/ =~ "hello@world", a = "hello", b ="world"
    method_name =~ /^hash_\w+/ || super
  end

end

america = Country.new("Amurrrica")
america.respond_to?(:to_s) #==> true

class Library
  SYSTEMS = ['arcade', 'atari', 'pc']

  attr_accessor :games

  def method_missing(name, *args)
    system = name.to_s
    if SYSTEMS.include?(system)
      self.class.class_eval do
        defined_method system do
          find_by_system(system)
        end
      end
      send system
    else
      super
    end
  end

  private
  def find_by_system(system)
    games.select { |game| game.system == system }
  end
end