require 'minitest/autorun'
require 'benchmark'

# Build a recursive method
def recursive_fib(num)
	return num if num == 0 || num == 1
	recursive_fib(num - 1) + recursive_fib(num - 2)
end


# Build an iterative solution
def iterative_fib(num)
	return num if num < 2
	fib = [0, 1]	
	(2..num).each do |digit|
		x = fib[digit - 1] + fib[digit - 2]
		fib << x
	end
	return fib.last
end

class TestFib < Minitest::Unit::TestCase
	def test_iterative_fib
		assert_equal( 13, iterative_fib(7), failure_message = nil)
	end

	def test_recursive_fib
		assert_equal( 21, recursive_fib(8), failure_message = nil)
	end
end

num = 35
Benchmark.bm do |x|
  x.report("recursive_fib") { recursive_fib(num) }
  x.report("iterative_fib")  { iterative_fib(num)  }
end