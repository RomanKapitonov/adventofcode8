require 'spec_helper'

RSpec.describe Actions::Rotate do
  shared_examples 'rotate row' do |coordinate:, index:, steps:, matrix:, expected_result:|
    context "given coordinate: #{coordinate} index: #{index} steps: #{steps}" do
      subject(:action) { described_class.new(coordinate: coordinate, index: index, steps: steps) }

      it 'rotates row' do
        expect(action.apply_to!(matrix)).to eq(expected_result)
      end
    end
  end

  [
    {
      coordinate: 'y',
      index: 0,
      steps: 2,
      matrix: [
        [0, 1, 0],
        [1, 0, 0],
        [0, 0, 1]
      ],
      expected_result: [
        [1, 0, 0],
        [1, 0, 0],
        [0, 0, 1]
      ]
    },
    {
      coordinate: 'x',
      index: 0,
      steps: 2,
      matrix: [
        [1, 0, 0],
        [0, 0, 0],
        [0, 0, 0]
      ],
      expected_result: [
        [0, 0, 0],
        [0, 0, 0],
        [1, 0, 0]
      ]
    }
  ].each do |data|
    include_examples 'rotate row', data
  end
end
