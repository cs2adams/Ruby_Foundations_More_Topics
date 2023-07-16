def compute
  return 'Does not compute.' unless block_given?
  yield
end

puts compute { 5 + 3 } == 8
puts compute { 'a' + 'b' } == 'ab'
puts compute == 'Does not compute.'

def compute_with_arg(arg)
  return 'Does not compute.' unless block_given?
  yield(arg)
end

puts compute_with_arg(3) { |num| num + 5 } == 8
puts compute_with_arg('Cam') { |name| name.upcase } == 'CAM'
puts compute_with_arg('abc') == 'Does not compute.'