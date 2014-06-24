require 'charter/pie_chart'
require 'charter/web_chart/google_chart/google_chart_module'

module Charter
  module WebChart
    module GoogleChart
      class PieChart < Charter::PieChart
        include Charter::WebChart::GoogleChart::GoogleChartModule

        def render(html_dom_id)
          datasets = data.collect do |column|
            if column.kind_of?(Array)
              title, val = column[0], column[1]
            else
              title, val = column, column.to_s.humanize
            end
            [title, val]

            # Js data
            # var data = google.visualization.arrayToDataTable([
            #                                                      ['Task', 'Hours per Day'],
            #                                                      ['Work',     11],
            #                                                      ['Eat',      2],
            #                                                      ['Commute',  2],
            #                                                      ['Watch TV', 2],
            #                                                      ['Sleep',    7]
            #                                                  ]);
          end

          js = <<-JS
            google.load("visualization", "1", {packages:["corechart"]});
            google.setOnLoadCallback(function () {
              var data = google.visualization.arrayToDataTable(#{datasets.to_json});
              var chart = new google.visualization.PieChart(document.getElementById('#{html_dom_id}'));
              chart.draw(data, #{chart_options.to_json});
            });
          JS
          js.html_safe
        end
      end
    end
  end
end