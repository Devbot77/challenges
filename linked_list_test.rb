class LinkedListNode
	attr_accessor :value, :next_node

	def initialize(value, next_node=nil)
		@value = value
		@next_node = next_node
	end
end

class Stack
	attr_reader :data

	def initialize
		@data = nil
	end

	def push(value)
		@data = LinkedListNode.new(value, @data)
	end

	def pop
		if @data != nil
			value = @data.value
			@data = @data.next_node
			value
		end
	end
end

def reverse_list(list)
	pushed = Stack.new
	popped = Stack.new
	popped_again = nil
	counter = 0

	while list
		pushed.push(list.value)
		counter += 1
		list = list.next_node
	end
	# puts pushed.data.inspect
	# 

	counter.downto(1) do |x|	
		popped.push(pushed.pop)
	end
	# puts popped.inspect


	counter.downto(1) do |x|
		popped_again = LinkedListNode.new(popped.pop, popped_again)
	end

	# puts popped_again.inspect
	return popped_again
end

def reverse_list2(list)
	stack1 = Stack.new

	head = nil
	while list
		head = LinkedListNode.new(list.value, head)
		stack1.push(list.value)

		list = list.next_node
	end
 	head
end


def reverse_list3
	stack1 = Stack.new
	head = nil
	
	while list
		stack1.push(LinkedListNode.new(list.value))
		list = list.next_node
	end
end

def print_values(list_node)
	if list_node
		print "#{list_node.value} --> "
		print_values(list_node.next_node)
	else
		print "nil\n"
		return
	end
end

node1 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2)

print_values(node3)
puts "------------"
revlist = reverse_list2(node3)
# puts node3.inspect
print_values(revlist)