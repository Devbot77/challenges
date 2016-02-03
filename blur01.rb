class Image
	def initialize(pixels)
		@pixels = pixels	# assign argument to instance variable
	end

	def output_image
		@pixels.each { |row| puts row.join }	# display each joined array on a new line
	end
end


image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])
image.output_image
