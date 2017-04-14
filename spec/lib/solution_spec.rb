require 'spec_helper'

RSpec.describe Solution do
  subject(:solver) { described_class.new() }

  describe '#solve' do
    it 'solves the problem' do
      expect(solver.solve).to eq(106)
    end
  end
end
