module BeepModule
  # Mixin methods
  def beep
    puts "BEEP!"
  end

  def self.check(expression)
    validation = /[\w_%+-]+@[\D.-]+\.[a-zA-Z]{2,4}/
    puts validation.match(expression)
  end

end