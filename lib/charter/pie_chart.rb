require 'charter/chart_base'
require 'gruff'

# Example
# -------
# Charter::Factory.build(:pie) do |chart|
#   chart.data = {'ruby' => 100,
#                 'python' => 12}
#   chart.columns = ['Language', 'Usage']
# end
module Charter
  class PieChart < ChartBase
    def to_blob
      g = prepare_gruff(:pie)

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
