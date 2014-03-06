module Charter
  class Configuration
    include ActiveSupport::Configurable
    config_accessor :web_api_name
    config_accessor :chart
    config_accessor :web_config


  end

  class WebConfiguration
    include ActiveSupport::Configurable
    config_accessor :background_color
    config_accessor :colors
    config_accessor :text_color
    config_accessor :line_width
  end
end