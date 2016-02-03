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
	stack1 = Stack.new
	stack2 = Stack.new
	stack3 = Stack.new
	counter = 0

	while list
		stack1.push(list.value)
		counter += 1
		list = list.next_node
	end
	puts stack1.inspect
	# 
	counter.downto(1) do |x|	
		stack2.push(stack1.pop)
	end

 	# while stack1.pop != nil
 	# 	stack2.push(stack1.pop)
 	# end
	puts stack2.inspect


	counter.downto(1) do |x|	
		stack3.push(stack2.pop)
	end
	puts stack3.inspect

	return stack3.data
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
# revlist = reverse_list(node3)
# # puts node3.inspect
# print_values(revlist)
