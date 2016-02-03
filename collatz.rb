require 'minitest/autorun'

module Collatz

	def self.find_sequence(num)
		return num if num == 1
		count = [1]
		until num == 1 do 
			if num.even?
				num = num/2
				count << num
			else
				num = (3 * num + 1)
				count << num
			end
		end
		return count.length
	end

	def self.long_sequence(low, high)
		high_val = 0
		high_length = 0
		(low..high).each do |val|
			seq_length = self.find_sequence(val)
			if high_length < seq_length
				high_length = seq_length
				high_val = val
			end
		end

		return high_val
	end
end

puts Collatz.long_sequence(1, 1000000)

class TestCollatz < Minitest::Unit::TestCase

	def test_collatz
		assert_equal(Collatz.find_sequence(3), 8, failure_message = nil)
	end

	def test_collatz_2
		assert_equal(Collatz.find_sequence(7), 17, failure_message = nil)
	end

end