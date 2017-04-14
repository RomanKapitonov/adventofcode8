require 'matrix'
require 'actions_parser'

class Solution
  attr_reader :parser, :matrix

  WIDTH = 50
  HEIGHT = 6

  DEFAULT_VALUE = 0
  FILLED_VALUE = 1

  def initialize(x = WIDTH, y = HEIGHT)
    @matrix = Array.new(y) { Array.new(x) { DEFAULT_VALUE } }
    @parser = ActionsParser.new
  end

  def solve
    actions.each do |action|
      @matrix = action.apply_to!(matrix)
    end

    filled
  end

  private

  def filled
    matrix.flatten.select { |e| e == FILLED_VALUE }.count
  end

  def actions
    parser.actions
  end
end
