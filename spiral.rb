class Spiral

  def initialize matrix
    @matrix = matrix
    @size = Math.sqrt(@matrix.flatten.length)
    raise ArgumentError, 'Matrix have not square type!' if @size % 1 != 0
    @size = @size.to_i
  end

  def order!
    result = []
    top = left = 0
    down = right = @size - 1
    while true
      left.upto(right) { |i| result << @matrix[top][i] }
      top += 1
      break if top > down || left > right

      top.upto(down) { |n| result << @matrix[n][right] }
      right -= 1
      break if top > down || left > right

      right.downto(left) { |n| result << @matrix[down][n]; }
      down -= 1
      break if top > down || left > right

      down.downto(top) { |n| result << @matrix[n][left] }
      left += 1
      break if top > down || left > right
    end
    result
  end

  def self.generate_n_matrix n
    result = []
    i = 1
    n.times do
      temp_buff = []
      n.times { temp_buff << i; i+=1; }
      result << temp_buff
    end
    result
  end

  def self.transform_to_spiral_linear(matrix)
    matrix.empty? ? [] : matrix.shift + transform_to_spiral_linear(matrix.transpose.reverse)
  end

end

