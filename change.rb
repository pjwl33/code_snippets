def get_change(num)
  values = [25, 10, 5, 1]
  result = 0
  values.each do |v|
    coins, remainder = num.divmod(v)
    result += coins
    num = remainder
  end
  return result
end

puts get_change(973)
puts get_change(1000)
puts get_change(11)