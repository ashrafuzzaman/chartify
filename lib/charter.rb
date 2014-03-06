module Charter
  autoload :Configuration, "charter/config"

  def self.configure(&block)
    yield @config ||= Charter::Configuration.new
  end

  def self.config
    @config
  end

  def web_configure(&block)
    yield @web_config ||= Charter::WebConfiguration.new
  end

  def web_config
    @web_config
  end

  configure do |config|
    config.web_api_name = :google_chart
    config.chart = {chart_js: {colors: [{
                                            fill_color: "rgba(220,220,220,0.5)",
                                            stroke_color: "rgba(220,220,220,1)",
                                            point_color: "rgba(220,220,220,1)",
                                            point_stroke_color: "#fff"
                                        },
                                        {
                                            fill_color: "rgba(151,187,205,0.5)",
                                            stroke_color: "rgba(151,187,205,1)",
                                            point_color: "rgba(151,187,205,1)",
                                            point_stroke_color: "#fff"
                                        }]}
    }

    config.web_configure do |wc|
      wc.background_color = '#FFFFFF'
      wc.colors = ['#3366CC', # blue
                           '#DC3912', # red
                           '#FF9900', # yellow
                           '#109618', # green
                           '#990099', # dk purple
                           '#0099C6', # sky
                           '#DD4477' # grey
      ]
      wc.text_color = '#666666'
      wc.line_width = 2
    end
  end
end