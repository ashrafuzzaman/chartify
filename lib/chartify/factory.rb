require 'chartify/gruff_themes'
require 'chartify/line_chart'
require 'chartify/pie_chart'
require 'chartify/bar_chart'
require 'chartify/column_chart'
require 'chartify/area_chart'

module Chartify
  class Factory
    # @param type can be of line, pie, bar etc
    def self.build(type, &block)
      raise "type has to be a symbol" unless type.kind_of? Symbol
      chart = "Chartify::#{type.to_s.camelize}Chart".constantize.new
      block.call chart
      chart
    end
  end
end