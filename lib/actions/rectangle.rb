require_relative 'action'

module Actions
  class Rectangle < Action
    attr_reader :x, :y

    def initialize(x: , y:, **)
      @x = x.to_i
      @y = y.to_i
    end

    def apply_to!(matrix)
      y.times do |i|
        row = matrix[i]

        x.times do |j|
          row[j] = Solution::FILLED_VALUE
        end
      end

      matrix
    end
  end
end
