require 'charter/line_chart'

module Charter
  module WebChart
    module GoogleChart
      class LineChart < Charter::LineChart
        def render(html_dom_id)
          js = <<-JS
            google.load("visualization", "1", {packages:["corechart"]});
            google.setOnLoadCallback(drawChart);
            function drawChart() {
              var data = google.visualization.arrayToDataTable(#{array_data_table.to_json});
              var chart = new google.visualization.LineChart(document.getElementById('#{html_dom_id}'));
              chart.draw(data, #{chart_options.to_json});
            }
          JS
          js.html_safe
        end

        def chart_options
          {
              title: title,
              backgroundColor: bg_color,
              colors: web_colors,
              vAxis: {baselineColor: baseline_color,
                      gridlines: {color: grid_color},
                      textStyle: {color: text_color}},
              hAxis: {baselineColor: baseline_color,
                      gridlines: {color: grid_color},
                      textStyle: {color: text_color}},
              legend: {textStyle: {color: text_color}},
              lineWidth: config.web_line_width
          }
        end

        protected
        def array_data_table
          array_data = [[label_column] + column_names]
          array_data + data.collect do |row|
            [row[label_column]] + column_keys.collect { |col| row[col] }
          end
        end
      end
    end
  end
end