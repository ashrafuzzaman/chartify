require 'charter/line_chart'

class ChartsController < ApplicationController

  def index
    @chart = Charter::LineChart.new
    @chart.data = [
        {day: 0, hours_remain: 10, estimated_hours_remain: 10},
        {day: 1, hours_remain: 8, estimated_hours_remain: 10},
        {day: 2, hours_remain: 6, estimated_hours_remain: 7},
        {day: 3, hours_remain: 4, estimated_hours_remain: 3},
        {day: 4, hours_remain: 2, estimated_hours_remain: 1},
        {day: 5, hours_remain: 0, estimated_hours_remain: 0}
    ]
    @chart.columns = {hours_remain: 'Hours remaining', estimated_hours_remain: 'Estimated hours remaining'}
    @chart.label_column = :day
  end
end
