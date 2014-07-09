require 'chartify/pie_chart'
require 'chartify/web_chart/google_chart/google_chart_module'

module Chartify
  module WebChart
    module GoogleChart
      class PieChart < Chartify::PieChart
        include Chartify::WebChart::GoogleChart::GoogleChartModule
        def render(html_dom_id)
          datasets = data.collect do |column|
            if column.kind_of?(Array)
              title, val = column[0], column[1]
            else
              title, val = column, column.to_s.humanize
            end
            [title, val]
          end
          insert_title_row(datasets)

          js = <<-JS
            var data = google.visualization.arrayToDataTable(#{datasets.to_json});
            var chart = new google.visualization.PieChart(document.getElementById('#{html_dom_id}'));
            chart.draw(data, #{chart_options.to_json});
          JS
          wrap_in_function(js).html_safe
        end

        private
        def insert_title_row(datasets)
          datasets.insert 0, column_names
        end
      end
    end
  end
end