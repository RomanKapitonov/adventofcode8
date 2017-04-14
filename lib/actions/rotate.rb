require_relative 'action'

module Actions
  class Rotate < Action
    attr_reader :coordinate, :index, :steps

    def initialize(coordinate: 'y', index: 0, steps: 0, **)
      @coordinate = coordinate
      @index = index.to_i
      @steps = steps.to_i
    end

    def apply_to!(matrix)
      matrix = case coordinate
      when 'x'
        transposed = matrix.transpose
        transposed[index] = transposed[index].rotate(-steps)
        transposed.transpose
      when 'y'
        matrix[index] = matrix[index].rotate(-steps)
        matrix
      end

      matrix
    end
  end
end
