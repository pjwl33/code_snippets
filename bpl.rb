my_proc = Proc.new { puts "tweet" }
my_proc.call

my_lambda = lambda { puts "tweet" }
#since Ruby v.1.0.0 - stabby lambdas are denoted by the -> symbol.
my_lambda = -> { puts "tweet" }
my_lambda.call

class Tweet
  attr_accessor :user, :password

  def initialize
    @user = "pjwl33"
    @password = "password"
  end

  def authenticate?(user, password)
    user == "pjwl33" && password == "password" ? true : false
  end

  def post(success, error)
    if authenticate? @user, @password
      success.call
    else
      error.call
    end
  end
end

t = Tweet.new
success = -> {puts "Sent!"}
error = -> {raise "Auth Error!"}
t.post(success, error)

class Timeline
  attr_accessor :tweets

  def initialize tweets
    @tweets = tweets
  end

  def each(&block)
    # for each tweet, run the block of code passed on tweet as an argument - &block takes the puts tweet as a block and runs it
    if block_given?
      tweets.each(&block)
    else
      puts "error"
    end
  end

end

tweets = ["hello world!", "this is awesome!", "what's the difference between procs, blocks, and lambdas?"]
timeline = Timeline.new(tweets)
printer = lambda { |tweet| puts tweet }
timeline.each(&printer)
# & can be used to turn a Proc or lambda, but not -> into a block of code for Symbol to, timeline.each(&:user) -> will ouput the user of the tweet

class Cheesecake
  def initialize
    yield self if block_given?
  end
end

Cheesecake.new do |cake|
  puts cake
end





