def call_block
  yield "hello world!"
end

call_block { |arg| puts arg }
call_block { |arg| puts arg.upcase }

def puts_block
  puts yield
end

puts_block { "hello world" }

class Brothers
  paul = {name: "Paul", age: 24, occupation: "Web developer"}
  john = {name: "John", age: 21, occupation: "Software engineer"}
  luke = {name: "Luke", age: 16, occupation: "Student"}
  @brothers = [paul, john, luke]

  # def self.each_on_occupation(occupation)
  #   @brothers.each do |bro|
  #     puts bro if bro[:occupation] == occupation
  #   end
  # end

  def self.each_print
    @brothers.each do |bro|
      yield bro
    end
  end
end

# Brothers.each_on_occupation("Web developer")
Brothers.each_print
