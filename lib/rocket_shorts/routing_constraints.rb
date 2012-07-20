module RocketShorts
  class RoutingConstraints
    def initialize(options)
      @version = options[:version]
      @versions = options[:versions]
      @default = options[:default]
    end

    def matches?(req)
      if @versions.present?
        @default || req.headers['Accept'].match(/#{RocketShorts.header_format}#{@versions}/)
      else
        @default || req.headers['Accept'].match(/#{RocketShorts.header_format}#{@version}/)
      end
    end
  end
end
