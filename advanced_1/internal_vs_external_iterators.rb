fact = Enumerator.new do |y|
  num = 0
  current_fact = 1
  loop do
    y << current_fact
    num += 1
    current_fact *= num
  end
end

7.times { p fact.next }
3.times { p fact.next }
fact.rewind
7.times { p fact.next }