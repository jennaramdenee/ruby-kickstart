# Require the stack code from challenge 1
# The code you added causes it to do this
#
# stack = Stack.new
# stack.push 1
# stack.push 2
# stack # => (2)1)


# But sometimes you want it to inspect like an array.
# stack # => [1, 2]
#
# Subclass the Stack class and override its inspect
# so that we can do this:
#
# stack = StackInDisguise.new
# stack.push 1
# stack.push 2
# stack # => [1, 2]

require File.expand_path("../1_stack_classes_inspect", __FILE__)

class StackInDisguise < Stack

  def inspect
    output = []
    while @head
      output.push(@head.data)
      break if @head.next_node == nil
      @head = @head.next_node
    end
    output.reverse.to_s
  end

end
