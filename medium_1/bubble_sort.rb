def bubble_sort!(arr)

  loop do
    swapped = false

    0.upto(arr.size - 2) do |idx|
      first = arr[idx]
      second = arr[idx + 1]

      if block_given?
        next if yield(first, second)
      else
        next if first < second
      end

      arr[idx], arr[idx + 1] = second, first
      swapped = true
    end

    break unless swapped
  end

  arr
end

array = [5, 3]
bubble_sort!(array)
puts array == [3, 5]

array = [5, 3, 7]
bubble_sort!(array) { |first, second| first >= second }
puts array == [7, 5, 3]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
puts array == [1, 2, 4, 6, 7]

array = [6, 12, 27, 22, 14]
bubble_sort!(array) { |first, second| (first % 7) <= (second % 7) }
puts array == [14, 22, 12, 6, 27]

array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort!(array)
puts array == %w(Kim Pete Tyler alice bonnie rachel sue)

array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort!(array) { |first, second| first.downcase <= second.downcase }
puts array == %w(alice bonnie Kim Pete rachel sue Tyler)

def bubble_sort_single_arg!(arr)

  loop do
    swapped = false

    0.upto(arr.size - 2) do |idx|
      first = arr[idx]
      second = arr[idx + 1]

      if block_given?
        next if yield(first) < yield(second)
      else
        next if first < second
      end

      arr[idx], arr[idx + 1] = second, first
      swapped = true
    end

    break unless swapped
  end

  arr
end

array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort_single_arg!(array) { |value| value.downcase }
p array == %w(alice bonnie Kim Pete rachel sue Tyler)