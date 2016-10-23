# Write a method, spiral_access, that takes a 2d square array (an array of arrays)
# and a block, and calls the block for each of the elements, in spiral order.
#
# HINT: This method is probably best sovled recursively
#
# Example:
# two_d = [
#   [ 1,  2,  3,  4, 5],
#   [16, 17, 18, 19, 6],
#   [15, 24, 25, 20, 7],
#   [14, 23, 22, 21, 8],
#   [13, 12, 11, 10, 9],
# ]
# order = []
# spiral_access two_d do |i|
#   order << i
# end
# order # => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25]

def spiral_access(arr)
  result = []
  #count is the number of times the spiral_inner function is executed
  count = 0

  #if 1x1 array
  if arr.length == 1
    return [arr.flatten]
  elsif arr.length == 2
    result << (arr[0] + arr[1].reverse)
  else
    #if size is even,run size/2 times
    for count in 0..arr.length/2
      result << spiral_inner(arr, count)
      count = count + 1
    end
    #if size is odd, run size/2 times, and add element at position [(size-1)/2]
    if arr.length.odd? == true
      result << arr[(arr.length-1)/2][(arr.length-1)/2]
    end
  end

  return result


  def spiral_inner(arr, count)

    #part 1: for row i, print elements i to length-i
    for element_row in (count..arr.length-1)
      result << arr[count][element_row]
    end

    #part 2: for counter_rows i+1 to length-i, print element in position length-i
    for element_col in (count+1..arr.length-count)
      result << arr[element_col][length-count]
    end

    #part 3: for row length-i, print elements length-i-1 to i
    (count..arr.length-count-1).reverse.each do |element_row|
      result << arr[length-count-1][element_row]
    end

    #part 4: for rows length-i-1 to i+1, print element in position i
    (count+1..arr.length-count-1).reverse.each do |element_col|
      result << arr[element_col][count]
    end
  end

end

two_d = [
  [ 1,  2,  3,  4, 5],
  [16, 17, 18, 19, 6],
  [15, 24, 25, 20, 7],
  [14, 23, 22, 21, 8],
  [13, 12, 11, 10, 9],
]
p spiral_access(two_d)
