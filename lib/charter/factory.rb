require 'charter/gruff_themes'
require 'charter/line_chart'
require 'charter/pie_chart'
require 'charter/bar_chart'

module Charter
  class Factory
    # @param type can be of line, pie, bar etc
    def self.build(type, &block)
      raise "type has to be a symbol" unless type.kind_of? Symbol
      chart = "Charter::#{type.to_s.camelize}Chart".constantize.new
      block.call chart
      chart
    end
  end
end