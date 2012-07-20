module RocketPants
  class Railtie < Rails::Railtie

    config.rocket_shorts = ActiveSupport::OrderedOptions.new
    config.rocket_shorts.header_format = /application\/vnd\.example\.v/

    initializer "rocket_shorts.configuration" do |app|
      rs_config                       = app.config.rocket_shorts
      RocketShorts.header_format      = rs_config.header_format
    end
  end
end
