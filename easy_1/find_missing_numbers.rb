require 'pry'
require 'pry-byebug'

def missing(arr)
  output = []
  arr = arr.clone
  current_num = arr.shift
  next_num = arr.shift

  until next_num.nil?
    output += ((current_num + 1)...next_num).to_a
    current_num = next_num
    next_num = arr.shift
  end

  output
end

puts missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
puts missing([1, 2, 3, 4]) == []
puts missing([1, 5]) == [2, 3, 4]
puts missing([6]) == []