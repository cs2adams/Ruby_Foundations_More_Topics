items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

gather(items) do |*fruit_and_veg, grain|
  puts fruit_and_veg.join(', ')
  puts grain
end

gather(items) do |fruit, *veg, grain|
  puts fruit
  puts veg.join(', ')
  puts grain
end

gather(items) do |fruit, *veg_and_grain|
  puts fruit
  puts veg_and_grain.join(', ')
end

gather(items) do |fruit, veg1, veg2, grain|
  puts "#{fruit}, #{veg1}, #{veg2}, and #{grain}"
end