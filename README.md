Charter
=======
The purpose of this gem is to capture data to create a chart in an object, so that we can do the following things

- Render javascript graph, (which can be chart library agnostic)
- Create the chart data using ruby only (no js to render chart)
- Export chart as image (Needed when you want to email a chart)
- Configuration for chart colors

Note
----
The project is in progress. So please wait for the release.

The project is similar to [chartkick](http://chartkick.com/). The reason I am planning to create another project 
is because it does not support to export charts in image.
  
Charts to support
-----------------
I plan to start supporting basic charts.
- Bar
- Pie
- Line
- Area

Plan for the library api
------------------------

Line chart
----------
```ruby
Charter.build(:line) do |chart|
    chart.data = [{...}]
    chart.columns = {hours_remain: I18n.t('hours_remain'), estimated_hours_remain: I18n.t('hours_estimated')}
    chart.label_column = :day
end
```

This project rocks and uses MIT-LICENSE.