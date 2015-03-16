load 'spiral.rb'

describe Spiral do

  context 'matrix ordering' do

    it 'should order matrix from 3 numbers a column/row' do
      spiral = Spiral.new [
        [1,2,3],
        [4,5,6],
        [7,8,9]
      ]
      expect(spiral.order!).to match_array [1,2,3,6,9,8,7,4,5]
    end

    it 'should order matrix from 4 numbers a column/row' do
      spiral = Spiral.new [
        [ 1, 2, 3, 4],
        [ 5, 6, 7, 8],
        [ 9,10,11,12],
        [13,14,15,16]
      ]
      expect(spiral.order!).to match_array [ 1,2,3,4,8,12,16,15,14,13,9,5,6,7,11,10]
    end

    it 'should raise error when matrix have square type' do
      matrix = [
        [ 1, 2, 3, 4 ],
        [ 5, 6, 7, 8 ]
      ]
      expect { Spiral.new(matrix) }.to raise_error(ArgumentError, 'Matrix have not square type!')
    end

  end

  30.times do |n|
    test = <<-RSPEC
      it 'should order #{n}x#{n} matrix' do
        matrix = Spiral.generate_n_matrix(#{n})
        expect(Spiral.new(matrix).order!).to match_array(Spiral.transform_to_spiral_linear(matrix))
      end
    RSPEC
    eval test
  end

end