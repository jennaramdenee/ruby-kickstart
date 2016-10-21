# Given a nonnegative integer, return a hash whose keys are all the odd nonnegative integers up to it
# and each key's value is an array containing all the even non negative integers up to it.
#
# Examples:
# staircase 1  # => {1 => []}
# staircase 2  # => {1 => []}
# staircase 3  # => {1 => [], 3 => [2]}
# staircase 4  # => {1 => [], 3 => [2]}
# staircase 5  # => {1 => [], 3 => [2], 5 =>[2, 4]}

def staircase(n)
  result = Hash.new(0)

  (1..n).each.with_index do |x, index|
    if x.odd? == true
      evens = []
      (x).downto(2) do |y|
        if y.even? == true
          evens << y
          evens.sort!
        end
      end
      result[x] = evens
    end
  end

  return result
end
