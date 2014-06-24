module Charter
  autoload :Configuration, "charter/config"

  def self.configure(&block)
    yield @config ||= Charter::Configuration.new
  end

  def self.config
    @config
  end

  configure do |config|
    config.web_api_name = :google_chart

    config.web do |wc|
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