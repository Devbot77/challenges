class Image
  
  def initialize(pixels)
    @pixels = pixels
  end

  def output_image
    @pixels.each { |row| puts row.join }
  end

  def blur(distance)
    # iterate through each element in @pixels and alter
    # surrounding elements if value = 1. 
    @pixels.each_with_index do |row, row_index|
      row.each_with_index do | column, column_index |
        next if column == 0 || column == "1"
        global_count = 0  #establish method variable for iterative reduction

        # alter rows along y axis by units specifed by distance
        (0..distance).each do |x|
          if row_index - x >= 0 
            @pixels[row_index - x][column_index] = "1"
            count = (distance - global_count)
            count.downto(0) do |y|    
              @pixels[row_index - x][column_index + y] = "1" if column_index + y < row.size - x 
              @pixels[row_index - x][column_index - y] = "1" if column_index - y >= 0
            end
          end
          if row_index < (@pixels.size - x) 
            @pixels[row_index + x][column_index] = "1" 
            count = (distance - global_count)
            count.downto(0) do |y|        
              @pixels[row_index + x][column_index + y] = "1" if column_index + y < row.size - x       
              @pixels[row_index + x][column_index - y] = "1" if column_index - y >= 0
            end
          end
          global_count += 1
        end
      end
    end
  end

end


image_3 = Image.new([
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 1, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 1]
])

image_3.blur(3)
image_3.output_image