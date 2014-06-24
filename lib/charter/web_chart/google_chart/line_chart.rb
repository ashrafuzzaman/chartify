require 'charter/line_chart'
require 'charter/web_chart/google_chart/google_chart_module'

module Charter
  module WebChart
    module GoogleChart
      class LineChart < Charter::LineChart
        include Charter::WebChart::GoogleChart::GoogleChartModule

        def render(html_dom_id)
          js = <<-JS
            google.load("visualization", "1", {packages:["corechart"]});
            google.setOnLoadCallback(function () {
              var data = google.visualization.arrayToDataTable(#{array_data_table.to_json});
              var chart = new google.visualization.LineChart(document.getElementById('#{html_dom_id}'));
              chart.draw(data, #{chart_options.to_json});
            });
          JS
          js.html_safe
        end
      end
    end
  end
end