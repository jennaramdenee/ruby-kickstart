# Write a method that takes a string and returns an array
# whose keys are all the downcased words in the string,
# and values are the number of times these words were seen.
#
# No punctuation will appear in the strings.
#
# Example:
# word_count "The dog and the cat" # => {"the" => 2, "dog" => 1, "and" => 1, "cat" => 1}

def word_count(s)
  if s == ""
    return {}
  end

  result = {}
  s.downcase!
  s = s.split(" ")
  s.each do |x|
    x = x.to_s
    result[x] = s.count(x)
  end
  return result
end
