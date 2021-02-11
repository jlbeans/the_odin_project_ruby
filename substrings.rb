dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

def substrings (words, dictionary)

  words = words.split(/\s/)

  sub_count = Hash.new(0)

  words.each do |word|
    dictionary.each do |dict_word|
        if word.include?(dict_word)||
          word.upcase.include?(dict_word.upcase)
            sub_count[dict_word] += 1
        end
    end
  end

  return sub_count
end


puts substrings("Go down below.",dictionary)
puts substrings("Howdy partner!", dictionary)
