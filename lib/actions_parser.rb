require_relative 'actions/rectangle'
require_relative 'actions/rotate'

module Registry
  extend self

  def config
    {
      'rotate' => Actions::Rotate,
      'rect' => Actions::Rectangle
    }
  end
end

class ActionsParser
  INPUT_PATH = 'lib/input'

  attr_reader :raw_actions, :registry

  PARSER = /(?<action>rotate|rect)\s+(((?<axis>column|row)\s+(?<coordinate>x|y)=(?<index>\d+)\s+by\s+(?<steps>\d+))|((?<x>\d+)x(?<y>\d+)))/

  def initialize(raw_actions = File.open(INPUT_PATH).to_a, registry = Registry)
    @raw_actions = raw_actions.map(&:chomp)
    @registry = registry
  end

  def actions
    raw_actions.map do |raw_action|
      result = PARSER.match(raw_action)
      args = Hash[result.names.map(&:to_sym).zip(result.captures)]

      registry.config[result[:action]].new(**args)
    end
  end
end
