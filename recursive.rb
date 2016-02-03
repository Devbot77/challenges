def recursive(param)
	puts "+ #{param}"
	return param if param == 1
	recursive(param - 1)
	puts "- #{param}"
end

r = recursive(5)
puts r