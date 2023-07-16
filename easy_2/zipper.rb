def zip(arr1, arr2)
  output = []
  arr1.each_with_index { |arr1_value, idx| output << [arr1_value, arr2[idx]] }
  output
end

puts zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]