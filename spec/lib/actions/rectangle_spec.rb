require 'spec_helper'

RSpec.describe Actions::Rectangle do
  describe '#apply_to' do
    shared_examples 'draws a rectangle' do |x:, y:, matrix:, expected_result:|
      context "given x: #{x}, y: #{y}" do
        subject(:action) { described_class.new(x: x, y: y) }

        it 'fills rectangle' do
          expect(action.apply_to!(matrix)).to eq(expected_result)
        end
      end
    end

    [{
      x: 2,
      y: 2,
      matrix: [
        [0, 0, 0],
        [0, 0, 0],
        [0, 0, 0]
      ],
      expected_result: [
        [1, 1, 0],
        [1, 1, 0],
        [0, 0, 0],
      ]
    },
    {
      x: 1,
      y: 3,
      matrix: [
        [0, 0, 0],
        [0, 0, 0],
        [0, 0, 0]
      ],
      expected_result: [
        [1, 0, 0],
        [1, 0, 0],
        [1, 0, 0]
      ]
    }].each do |data|
      include_examples 'draws a rectangle', data
    end
  end
end
