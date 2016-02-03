require 'minitest/autorun'

class Tree
	attr_accessor :payload, :children

	def initialize(payload, children)
		@payload = payload
		@children = children
	end
end

def depth_search(node, val)
	puts "Current node = #{node.payload}, #{node}, #{val}"
	puts (node.payload == val)
	answer = nil
	return node if node.payload == val
	node.children.each do |child|
		answer = depth_search(child, val)
		return answer if answer
	end

	nil
end

def depth_search_it(node, val)
	queue = [node]

	while current = queue.shift
		puts "Current node = #{current.payload}, #{current}, #{val}"
		return current if current.payload == val
		queue = current.children + queue
		puts queue
		# current.children.reverse.each do |child|
		# 	queue.unshift(child)
		# end
	end	
end

def breadth_search(node, val)
	queue = [node]
	
	while current = queue.shift 		# why isn't !queue.nil? working here?
		puts "Current node = #{current.payload}, #{current}, #{val}"
		return current if current.payload == val	# check the node and return if matching
		queue = queue + current.children
		# current.children.each do |child|		# push node's children into queue, rinse and repeat
		# 	queue.push(child)
		# end 
	end
end
			 

@fifth_node    = Tree.new(5, [])
@eleventh_node = Tree.new(11, [])		# Why do I need instance variables here for test class to use them?
fourth_node   = Tree.new(4, [])
ninth_node = Tree.new(9, [fourth_node])
sixth_node = Tree.new(6, [@fifth_node, @eleventh_node])
seventh_node = Tree.new(7, [sixth_node])
fifth_node = Tree.new(5, [ninth_node])
# The "Trunk" of the tree
@trunk   = Tree.new(2, [seventh_node, fifth_node])

# puts depth_search_it(@trunk, 11).inspect
# puts breadth_search(@trunk, 11).inspect
puts depth_search(@trunk, 11).inspect

a = @trunk.children.each do |child|
	# depth_search(child, 11)
end
# puts a.first.payload

class TestTreeSearch < Minitest::Unit::TestCase

	def test_depth_first
		assert_equal(@eleventh_node, depth_search_it(@trunk, 11), failure_message = nil)
	end

	def test_breadth_first
		assert_equal(@eleventh_node, breadth_search(@trunk, 11), failure_message = nil)
	end
end