# Write a method named prime_chars? which takes array of strings
# and returns true if the sum of the characters is prime.
#
# Remember that a number is prime if the only integers that can divide it with no remainder are 1 and itself.
#
# Examples of length three
# prime_chars? ['abc']            # => true
# prime_chars? ['a', 'bc']        # => true
# prime_chars? ['ab', 'c']        # => true
# prime_chars? ['a', 'b', 'c']    # => true
#
# Examples of length four
# prime_chars? ['abcd']           # => false
# prime_chars? ['ab', 'cd']       # => false
# prime_chars? ['a', 'bcd']       # => false
# prime_chars? ['a', 'b', 'cd']   # => false

def prime_chars?(arr)
  #calculate sum of characters e.g. 6
  sum = arr.join.size
  if sum == 0 || sum == 1
    return false
  end
  #loop through every number from 1 to sum e.g. 1 to 6, divide sum by number e.g. 6 divided by 2
  dividers = (1..sum).map { |x| sum % x }
  #count the number of times it is divisible, if it's more than once, it's not prime, return false
  if dividers.count(0) > 2
    return false
  else
    return true
  end

end
