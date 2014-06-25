Charter
=======
The purpose of this gem is to capture data to create a chart, in an object, so that we can do the following things

- Render javascript graph, (which can be chart library agnostic)
- Create the chart data using ruby only (no js to render chart)
- Export chart as image (Needed when you want to email a chart)
- Configuration for chart colors

Note
----
The project is in progress. So please wait for the release.

The project is similar to [chartkick](http://chartkick.com/). The reason I am planning to create another project
is because it does not support to export charts in image.

Charts supported
----------------
* Line chart
* Bar chart
* Pie chart

For generating image from the chart data we are using [Gruff](https://github.com/topfunky/gruff)

Here are some sample code to generate graph object and render to web.
```ruby
@chart = Charter::Factory.build(:line) do |chart|
  chart.data = [{hours_remain: 100, estimated_hours_remain: 100, day: 3.days.ago.to_date},
                {hours_remain: 50, estimated_hours_remain: 45, day: 2.days.ago.to_date},
                {hours_remain: 5, estimated_hours_remain: 10, day: 1.days.ago.to_date}]
  chart.columns = {hours_remain: 'Hours remaining', estimated_hours_remain: 'Estimated hours remaining'}
  chart.label_column = :day
end
```
In the web page,
```erb
<div id="chart" style="width: 900px; height: 180px;"></div>
<%= @chart.render_chart('chart') %>
```
To export the chart as image,
```ruby
@chart.to_blob
```
Now you can attach the blob to email or in the PDF file.

License
-------
This project rocks and uses MIT-LICENSE.
