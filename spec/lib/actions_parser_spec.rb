require 'spec_helper'
require 'actions_parser'

RSpec.describe ActionsParser do
  describe '#actions' do
    subject(:parser) { described_class.new(raw_actions, FakeRegistry) }

    class FakeAction
      def initialize(*)
      end
    end

    module FakeRegistry
      extend self

      def config
        {
          'rect' => FakeAction,
          'rotate' => FakeAction
        }
      end
    end

    let(:raw_actions) do
      [
        "rect 1x1",
        "rotate row y=0 by 3",
        "rect 1x2",
        "rotate row y=1 by 5"
      ]
    end

    let(:expected_result) { parser.actions }

    it 'returns a list of actions' do
      expect(expected_result.size).to eq(4)

      expected_result.each do |action|
        expect(action).to be_a(FakeAction)
      end
    end
  end
end
