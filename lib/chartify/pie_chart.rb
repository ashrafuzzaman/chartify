require 'chartify/chart_base'
require 'gruff'

# Example
# -------
# Chartify::Factory.build(:pie) do |chart|
#   chart.data = {'ruby' => 100,
#                 'python' => 12}
#   chart.columns = ['Language', 'Usage']
# end
module Chartify
  class PieChart < ChartBase
    def initialize
      super
      self.columns = ['Title', 'Value']
    end

    def to_blob
      g = instantiate_gruff(:pie)

      data.each do |row|
        if row.kind_of?(Array)
          key, val = row[0], row[1]
        else
          key, val = row.key, row.val
        end
        g.data(key, val)
      end
      g.to_blob
    end
  end
end
