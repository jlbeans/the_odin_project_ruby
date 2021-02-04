def caesar_cipher(str, number)
  str.chars.map do |char|
    ordinal_value = char.ord
    next(char) unless is_letter?(ordinal_value)
    start = if char == char.upcase
              'A'.ord
            else
              'a'.ord
            end

    shifted_str = (number + ordinal_value - start) % 26
    (start + shifted_str).chr
  end.join
end

def is_letter?(ordinal_value)
  (ordinal_value >= 'a'.ord && ordinal_value <= 'z'.ord) ||
  (ordinal_value >= 'A'.ord && ordinal_value <= 'Z'.ord)
end

  p caesar_cipher("How are you?",8)
  p caesar_cipher("I'm fine, thanks.",5)
