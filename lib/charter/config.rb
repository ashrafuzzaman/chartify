module Charter
  class Configuration
    include ActiveSupport::Configurable
    config_accessor :web_api_name
    config_accessor :chart

    def web(&block)
      yield @web_config ||= Charter::WebConfiguration.new
    end

    def web_config
      @web_config
    end
  end

  class WebConfiguration
    include ActiveSupport::Configurable
    config_accessor :background_color
    config_accessor :colors
    config_accessor :text_color
    config_accessor :line_width
  end
end