puts "Outside the class: #{self}"

class Tweet
  # puts "Inside the class: #{self}"
  attr_accessor :content, :created_at
  def initialize(content)
    @content = content
    @created_at = Time.now
  end
end

Tweet.class_eval do
  attr_accessor :user
  def say_hi
    puts "Hi"
  end
end

t = Tweet.new("hellow world!")
t.user = "pjwl33"
puts t.user, t.content

class MethodLogger
  def log_method(class_object, method_name)
    # this opens up the class that we are essentially adding a new method name to by reponening it, creating an alias for the method as well as defining it and then sending that method to be called
    class_object.class_eval do
      alias_method "#{method_name}_original", method_name
      define_method method_name do |*args, &block|
        puts "#{Time.now}: Called #{method_name}"
        send "#{method_name}_original", *args, &block
      end
    end
  end
end

logger = MethodLogger.new
logger.log_method(Tweet, :say_hi)

class Pizza
  attr_accessor :type, :price
  def initialize(&block)
    # will call this on the instance self
    instance_eval(&block) if block_given?
  end
end

Pizza.new do
  self.type = "Buffalo chicken"
  self.price = 24.00
end