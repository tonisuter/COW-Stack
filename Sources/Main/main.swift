import Stack

var stack1 = Stack<Int>(capacity: 5)
stack1.push(10)
stack1.push(20)
stack1.push(30)
print("stack1: ", stack1)

var stack2 = stack1 // At this point, both stacks share the same buffer.
print("stack1: ", stack1)
print("stack2: ", stack2)

stack2.pop() // To maintain value semantics, stack2 clones the shared buffer before performing the pop() operation.
print("stack1: ", stack1)
print("stack2: ", stack2)
