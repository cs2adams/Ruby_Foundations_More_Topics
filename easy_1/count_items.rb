def count(arr, &block)
  num_true_vals = 0
  arr.each { |el| num_true_vals += 1 if block.call(el) == true }
  num_true_vals
end

puts count([1,2,3,4,5]) { |value| value.odd? } == 3
puts count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
puts count([1,2,3,4,5]) { |value| true } == 5
puts count([1,2,3,4,5]) { |value| false } == 0
puts count([]) { |value| value.even? } == 0
puts count(%w(Four score and seven)) { |value| value.size == 5 } == 2

def count_without_looping(arr, &block)
  arr.inject(0) { |total, value| total + (block.call(value) ? 1 : 0) }
end

puts count_without_looping([1,2,3,4,5]) { |value| value.odd? } == 3
puts count_without_looping([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
puts count_without_looping([1,2,3,4,5]) { |value| true } == 5
puts count_without_looping([1,2,3,4,5]) { |value| false } == 0
puts count_without_looping([]) { |value| value.even? } == 0
puts count_without_looping(%w(Four score and seven)) { |value| value.size == 5 } == 2