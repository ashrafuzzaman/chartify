require 'chartify/chart_base'
require 'gruff'

# Example
# -------
# Chartify::Factory.build(:area) do |chart|
#   chart.data = [{hours_remain: 100, estimated_hours_remain: 100, day: 3.days.ago.to_date},
#              {hours_remain: 50, estimated_hours_remain: 45, day: 2.days.ago.to_date},
#              {hours_remain: 5, estimated_hours_remain: 10, day: 1.days.ago.to_date}]
#   chart.columns = {hours_remain: 'Hours remaining', estimated_hours_remain: 'Estimated hours remaining'}
#   chart.label_column = :day
# end
module Chartify
  class AreaChart < ChartBase
    def to_blob
      g = prepare_gruff(:area)

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
