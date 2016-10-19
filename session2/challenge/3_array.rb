# Write a method named every_other_char for strings that,
# returns an array containing every other character
#
# example:
# "abcdefg".every_other_char  # => "aceg"
# "".every_other_char         # => ""

class String
  def every_other_char
    result = ""
    each_char.with_index do |x, index|
      if index.even? == true
        result = result + x
      end
    end 
    return result
  end
end
