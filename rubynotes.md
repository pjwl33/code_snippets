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

-> output is "Goodbye"

def greeting
  my_proc = Proc.new {return "Hello"}
  my_proc.call

  return "Goodbye"
end

-> output is "Hello"

.send(symbol or string of the method name in a class) will call even private methods

protected vs. private - usually has to do with .send vs. .public_send. public send will allow to pass only to non-protected or private methods.

enumberables are mixin modules that allow collection sorting, like the .each, .map methods

.inject (block passed with arguments - first arg is the accumulator value, followed by the element itself)

ruby regex for email: ^[\w]+@[\w(-)]+\.[a-zA-Z]{2,4}$ -- means any word, number chacter (included -), then in () means an exclusion, have \ before special symbols to add them to the string

Class.class_eval allows you to modifiy a class object without reponening (what you write in here is exactly as you would just write in the class itself, no need to defined_method or alias_method UNLESS that is what you are specifically going for OR to create a method with string interpolation)
instance.instance_eval allows you to modifiy a class object without reponening