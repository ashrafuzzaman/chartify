require 'chartify/chart_base'
require 'gruff'

# Example
# -------
# Chartify::Factory.build(:line) do |chart|
#   chart.data = [{hours_remain: 100, estimated_hours_remain: 100, day: 3.days.ago.to_date},
#              {hours_remain: 50, estimated_hours_remain: 45, day: 2.days.ago.to_date},
#              {hours_remain: 5, estimated_hours_remain: 10, day: 1.days.ago.to_date}]
#   chart.columns = {hours_remain: 'Hours remaining', estimated_hours_remain: 'Estimated hours remaining'}
#   chart.label_column = :day
# end

module Chartify
  class LineChart < ChartBase
    def to_blob
      g = prepare_gruff(:line)

      columns.each do |column|
        if column.kind_of?(Array)
          key, text = column[0], column[1]
        else
          key, text = column, column.to_s.humanize
        end

        g.data(text, data_for_column(key))
      end

      labels = {}
      data_for_column(label_column).each_with_index do |label, index|
        labels[index] = label.to_s
      end

      g.labels = labels
      g.to_blob
    end
  end
end
