def divisors(num)
  output = []
  max_divisor = num
  current_div = 0
  quotient = 0

  loop do
    current_div += 1
    break if current_div > max_divisor

    quotient, remainder = num.divmod(current_div)
    next unless remainder == 0

    next_divisors = quotient == current_div ? [quotient] : [current_div, quotient]
    output += next_divisors

    max_divisor = quotient - 1
  end

  output
end

p divisors(1) #== [1]
p divisors(7) #== [1, 7]
p divisors(12) #== [1, 2, 3, 4, 6, 12]
p divisors(98) #== [1, 2, 7, 14, 49, 98]
p divisors(99400891) #== [1, 9967, 9973, 99400891] # may take a minute
p divisors(999962000357)