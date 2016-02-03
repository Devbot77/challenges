class Guitar
	attr_accessor :strings, :output

	def initialize(strings, output)
		@strings = strings
		@output = output
	end
end


gibson = Guitar.new(6, "electric")
martin = Guitar.new(6, "acoustic")
puts gibson.inspect
puts martin.inspect