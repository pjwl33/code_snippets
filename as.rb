require "active_support/all"
require "i18n"

array = [1, 2, "hello", 4, "goodbye", 6]
puts "---------------"

puts array.from(2)
puts "---------------"
puts array.to(5)
puts "---------------"
puts array.in_groups_of(2)
puts "---------------"
puts array.split(2)

today = DateTime.new(2014, 7, 12, 14, 5, 22)
puts today.at_beginning_of_day
puts today.at_end_of_month
puts today.at_beginning_of_year
puts today.advance years: 2, months: 4, weeks: 2, days: 1
puts today.tomorrow
puts today.yesterday
puts today.beginning_of_week

default_person = {species: "homo sapien", location: "Ann Arbor"}
paul = {name: "Paul", age: 24, occupation: "web developer"}
john = {name: "John", age: 21, occupation: "web developer"}
luke = {name: "Luke", age: 16, occupation: "student"}

puts paul.diff john
puts john.diff luke
puts paul.stringify_keys
puts luke.stringify_values
puts paul.reverse_merge default_person
puts luke.except :occupation

#for strings: .pluralize, .titleize, .capitalize, .humanize
