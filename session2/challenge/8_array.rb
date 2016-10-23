# Given an array of elements, return true if any element shows up three times in a row
#
# Examples:
# got_three? [1, 2, 2, 2, 3]  # => true
# got_three? ['a', 'a', 'b']  # => false
# got_three? ['a', 'a', 'a']  # => true
# got_three? [1, 2, 1, 1]     # => false

def got_three?(arr)
  counter = 0
  store = ""

  arr.each do |x|
    if store == x
      counter += 1
    else
      store = x
      counter = 0
    end
    if counter == 2
      return true
    end
  end
  return false
end
