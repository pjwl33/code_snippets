###calling super on a ruby class without arguments will then immediately take in the argurments of the parent class method

###Mixin with Modules vs. Class inheritance - all classes with same methods, and create a shareable class to inherit there. BUT ruby class can only inherit one class and it is mainly used for speciliazation. So use a Mixin for multiple methods and include module.

Use 'extend' instead of 'include' if you want to use Module methods as class methods, include is for instance methods

yield will essentially run that code in the block {}

###DIFFERENCE BETWEEN proc & lambda - a Proc.new will return the Proc object AS WELL AS THE METHOD WITHIN THE BLOCK. however, a lambda will only return the lambda object except. For example, in a method:

def greeting
  my_lambda = lambda {return "Hello"}
  my_lambda.call

  return "Goodbye"
end

-> output is "Goodbye" - more like a function, scope of funciton, precise number of arguments

def greeting
  my_proc = Proc.new {return "Hello"}
  my_proc.call

  return "Goodbye", returns both proc object and block, not as strict on argument number
end

-> output is "Hello"

.send(symbol or string of the method name in a class) will call even private methods

protected vs. private - usually has to do with .send vs. .public_send. public send will allow to pass only to non-protected or private methods.

enumberables are mixin modules that allow collection sorting, like the .each, .map methods

.inject (block passed with arguments - first arg is the accumulator value, followed by the element itself)

ruby regex for email: ^[\w]+@[\w(-)]+\.[a-zA-Z]{2,4}$ -- means any word, number chacter (included -), then in () means an exclusion, have \ before special symbols to add them to the string

Class.class_eval allows you to modifiy a class object without reponening (what you write in here is exactly as you would just write in the class itself, no need to defined_method or alias_method UNLESS that is what you are specifically going for OR to create a method with string interpolation)
instance.instance_eval allows you to modifiy a class object without reponening

scope :default_permissions_for, lambda{|user| { :conditions => { :user_id => user.id, :is_default => true } }
scope :deafult_permissions_for, -> {|user| {conditions: {user_id: user.id}}}

/(?<a>\w+\s*)+@(?<b>\s*\w+)/ =~ "hello@world", a = "hello", b = "world"
[12] pry(main)> /(?<a>\w+\s*)+@(?<b>\s*\w+)/.match("hello@world")[:a]
"hello"
[13] pry(main)> /(?<a>\w+\s*)+@(?<b>\s*\w+)/.match("hello@world")[:b]
"world"
[14] pry(main)> /(?<dollars>\d+)+\.(?<cents>\d+{2}))/.match("2.33")
SyntaxError: (eval):2: unmatched close parenthesis: /(?<dollars>\d+)+\.(?<cents>\d+{2}))/
[14] pry(main)> /(?<dollars>\d+)+\.(?<cents>\d+{2})/.match("2.33")
#<MatchData "2.33" dollars:"2" cents:"33">
[15] pry(main)> /(?<dollars>\d+)+\.(?<cents>\d+{2})/.match("2.33")[:dollars]
"2"
[16] pry(main)> /(?<dollars>\d+)+\.(?<cents>\d+{2})/.match("2.33")[:cents]
"33"
[17] pry(main)>