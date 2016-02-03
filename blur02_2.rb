class Image
  
  def initialize(pixels)
    @pixels = pixels
  end

  def output_image
    @pixels.each { |row| puts row.join }
  end

  def blur
    # create a copy of @pixels and fill with 0's
    arr = Array.new(@pixels.size) { Array.new(@pixels.first.size) {0}}

    # iterate through each element in @pixels and alter
    # surrounding elements if value = 1. Uses if statements 
    # to validate indexes for alteration.
    @pixels.each_with_index do |row, row_index|
      row.each_with_index do | column, column_index |
        if column == 1
          arr[row_index][column_index] = 1
          arr[row_index - 1][column_index] = 1 if row_index > 0
          if row_index < (@pixels.size - 1) then arr[row_index + 1][column_index] = 1 end
          if column_index > 0 then arr[row_index][column_index - 1] = 1 end
          if column_index < (row.size - 1) then arr[row_index][column_index + 1] = 1 end
        end
      end
    end
    @pixels = arr
  end

end


image_1 = Image.new([
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0]
])

image_2 = Image.new([
  [0, 0, 0, 0],
  [0, 0, 1, 0],
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0]
])

image_3 = Image.new([
  [0, 1, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 1, 0],
  [0, 0, 0, 0]
])

image_3.blur
image_3.output_image