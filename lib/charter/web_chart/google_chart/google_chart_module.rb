require 'charter/bar_chart'

module Charter
  module WebChart
    module GoogleChart
      module GoogleChartModule
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
              lineWidth: config.web_config.line_width
          }
        end

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