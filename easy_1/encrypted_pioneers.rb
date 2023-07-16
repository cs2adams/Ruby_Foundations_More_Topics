LOWERCASE_LETTERS = ('a'..'z').to_a.freeze
UPPERCASE_LETTERS = ('A'..'Z').to_a.freeze
NUM_LETTERS = 26

def wrapped_index(idx, max_idx = NUM_LETTERS)
  idx % max_idx
end

def target_array(char)
  return LOWERCASE_LETTERS if LOWERCASE_LETTERS.include?(char)
  return UPPERCASE_LETTERS if UPPERCASE_LETTERS.include?(char)
  nil
end


def decode(text, offset = 13)
  output = ''

  text.each_char do |char|
    target_arr = target_array(char)

    if target_arr
      current_idx = wrapped_index(target_arr.index(char) + offset)
      char = target_arr[current_idx]
    end
    output << char
  end

  output
end

pioneers = File.read("encrypted_pioneers.txt")
pioneers = decode(pioneers)
puts pioneers