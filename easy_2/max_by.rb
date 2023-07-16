def max_by(arr, &block)
  output = nil
  value = nil

  arr.each do |el|
    current_value = block.call(el)

    if value.nil? || value < current_value
      output = el
      value = current_value
    end
  end

  output
end

puts max_by([1, 5, 3]) { |value| value + 2 } == 5
puts max_by([1, 5, 3]) { |value| 9 - value } == 1
puts max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
puts max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
puts max_by([-7]) { |value| value * 3 } == -7
puts max_by([]) { |value| value + 5 } == nil