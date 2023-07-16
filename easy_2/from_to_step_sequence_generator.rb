def step(lower, upper, step_size, &block)
  counter = lower
  output = []

  while counter <= upper
    output << block.call(counter)
    counter += step_size
  end

  output
end

p step(1, 10, 3) { |value| puts "value = #{value}" }