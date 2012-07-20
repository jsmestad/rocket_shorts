module RocketShorts
  class RoutingConstraints
    def initialize(options)
      @version = options[:version]
      @versions = options[:versions]
      @default = options[:default]
    end

    def matches?(req)
      puts 'yoyoyo'
      req.headers['Accept'].match(/#{RocketShorts.header_format}#{@versions}/)
      # if @versions.present?
        # @default ||
      # else
        # @default || req.headers['Accept'].match(/#{RocketShorts.header_format}#{@version}/)
      # end
    end
  end
end
