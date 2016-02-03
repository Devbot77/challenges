require 'minitest/autorun'

module Luhn
	def self.is_valid?(number)
		# return array of reversed integers
		flipped =  number.to_s.reverse.split("").map {|digit| digit.to_i}
		sum = []

		# iterate through flipped array, mutate odd indexes, push all values to sum array
		flipped.each_with_index do |value, index|
			if index.odd?
				value*2 >= 10 ? sum << value*2 - 9 : sum << value*2			
			else 
				sum << value
			end
		end
		# add values and validate if divisible by 10
		sum.reduce(:+) % 10 == 0 ? true : false

	end
end

puts Luhn.is_valid?(4194560385008504)

class TestLuhn < Minitest::Unit::TestCase

	def test_luhn_valid
		assert Luhn.is_valid?(4194560385008504)
	end

	def test_luhn_invalid
		assert ! Luhn.is_valid?(4194560385008505)
	end

	def test_luhn_valid2
		assert Luhn.is_valid?(377681478627336), "Check step two: Did you start at the right?"
	end

	def test_luhn_invalid2
		assert ! Luhn.is_valid?(377681478627337), "Check step two: Did you start at the right?"
	end

end