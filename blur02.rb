class Image
	
  def initialize(pixels)
		@pixels = pixels
	end

	def output_image
		@pixels.each do |row|
      puts row.join
    end
	end

  def blur
    arr = @pixels
    n = @pixels.length
    @pixels.flatten!.each do |x|
      i = @pixels.index(x)
      if x == 1
        if i - 1 >= 0 then arr[i - 1] = "1" end
        if i - 4 >= 0 then arr[i - 4] = "1" end
        if i + 1 <= @pixels.length - 1 then arr[i + 1] = "1" end
        if i + 4 <= @pixels.length - 1 then arr[i + 4] = "1" end
      end
    end
    puts @pixels.join
    n.times { puts arr.slice!(0..3).join }
    #arr.each { |y| puts y.join}
  end

end


image_1 = Image.new([
  [0, 0, 0, 0],
  [0, 0, 1, 0],
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0]
])


image_1.blur
