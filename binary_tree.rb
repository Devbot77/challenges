class BinaryTree
	attr_accessor :payload, :left, :right

	def initialize(payload, left, right)
		@payload = payload
		@left = left
		@right = right
	end


end

def build(list)
	trunk = BinaryTree.new(list.shift, nil, nil)
	previous = trunk
	current = nil
	while list.first
		current = list.shift
		if current < trunk.payload && trunk.left.nil?
			trunk.left = current
		elsif current < trunk.payload && !trunk.left.nil?
		elsif current > trunk.payload && trunk.right.nil?
			trunk.right = current
			
		end
	end

	# puts trunk.inspect
	return trunk
end

def binary_sort(list)
	tree = build(list)
	
	puts tree.inspect
end

test_list = [7, 4, 9, 1, 6, 14, 10]
binary_sort(test_list)