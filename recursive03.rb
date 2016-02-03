require 'minitest/autorun'
require 'benchmark'


@cache = {}

def recursive_fib(num)
	return num if num == 0 || num == 1
	a = @cache[num-1] 
	b = @cache[num-2]
	puts "OK" if a || b
	if a.nil? 
		a = recursive_fib(num - 1)
		@cache[num-1] = a
	end 
	b = recursive_fib(num - 2) if b.nil?
	a + b
end

# class TestFib < Minitest::Unit::TestCase
# 	def test_recursive_fib
# 		assert_equal( 21, recursive_fib(8), failure_message = nil)
# 	end
# end
puts recursive_fib(8)

# num = 35
# Benchmark.bm do |x|
#   x.report("recursive_fib") { recursive_fib(num) }
# end