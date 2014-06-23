require 'charter/line_chart'

# Sample javascript
# -----------------
# var ctx = document.getElementById("example1").getContext("2d");
# var data = {
#    labels: ["January", "February", "March", "April", "May", "June", "July"],
#    datasets: [
#        {
#            fillColor: "rgba(220,220,220,0.5)",
#            strokeColor: "rgba(220,220,220,1)",
#            pointColor: "rgba(220,220,220,1)",
#            pointStrokeColor: "#fff",
#            data: [65, 59, 90, 81, 56, 55, 40]
#        },
#        {
#            fillColor: "rgba(151,187,205,0.5)",
#            strokeColor: "rgba(151,187,205,1)",
#            pointColor: "rgba(151,187,205,1)",
#            pointStrokeColor: "#fff",
#            data: [28, 48, 40, 19, 96, 27, 100]
#        }
#    ]
# }
# var myNewChart = new Chart(ctx).Line(data);

module Charter
  module WebChart
    module ChartJs
      class LineChart < Charter::LineChart
        def render(html_dom_id)
          datasets = []
          colors = Charter.config.chart[:chart_js][:colors]

          columns.each_with_index do |column, i|
            if column.kind_of?(Array)
              key, text = column[0], column[1]
            else
              key, text = column, column.to_s.humanize
            end
            color = colors[i%colors.size]
            datasets << {
                fillColor: color[:fill_color],
                strokeColor: color[:stroke_color],
                pointColor: color[:point_color],
                pointStrokeColor: color[:point_stroke_color],
                data: data_for_column(key)}
          end

          js = <<-JS
            var lineChartData = {
                labels: #{data_for_column(label_column).to_json},
                datasets: #{datasets.to_json}
            }
            var myLine = new Chart(document.getElementById("#{html_dom_id}").getContext("2d")).Line(lineChartData, {bezierCurve: false});
          JS
          js.html_safe
        end
      end
    end
  end
end