# given a string, return the character after every letter "r"
#
# pirates_say_arrrrrrrrr("are you really learning Ruby?") # => "eenu"
# pirates_say_arrrrrrrrr("Katy Perry is on the radio!")   # => "rya"
# pirates_say_arrrrrrrrr("Pirates say arrrrrrrrr")        # => "arrrrrrrr"

def pirates_say_arrrrrrrrr(string)
  result = ""
  string.each_char.with_index do |letter, index|
    unless string.size-1 == index
      if (letter == "r" || letter == "R")
        next_letter = string[index + 1]
        result = result + next_letter
      end
    end
  end
  return result
end
