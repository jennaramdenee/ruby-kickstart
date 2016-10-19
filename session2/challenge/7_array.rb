# Given a sentence, return an array containing every other word.
# Punctuation is not part of the word unless it is a contraction.
# In order to not have to write an actual language parser, there won't be any punctuation too complex.
# There will be no "'" that is not part of a contraction.
# Assume each of these  charactsrs are not to be considered: ! @ $ # % ^ & * ( ) - = _ + [ ] : ; , . / < > ? \ |
#
# Examples
# alternate_words("Lorem ipsum dolor sit amet.")  # => ["Lorem", "dolor", "amet"]
# alternate_words("Can't we all get along?")      # => ["Can't", "all", "along"]
# alternate_words("Elementary, my dear Watson!")  # => ["Elementary", "dear"]

def alternate_words(s)

  #remove all non-apostrophe characters
  s.gsub!(/[!@$#%^&*()-=_+[]:;,./<>?\|]/)
  #separate into words, returns an array
  arr = s.split(" ")
  #loop through letters in word
  arr.each.with_index do |letter, index|
    #look for the last & first letter of each word
    if letter[-1] == "'" || letter[0] == "'"
      #if it's an apostrophe, replce with empty character
      letter[index] = ""
    end
  end


end
