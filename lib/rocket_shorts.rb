require "rocket_pants"

require "rocket_shorts/version"

module RocketShorts
  autoload :Base, 'rocket_shorts/base'
  autoload :Routing, 'rocket_shorts/routing'
  autoload :RoutingConstraints, 'rocket_shorts/routing_constraints'
  autoload :Versioning, 'rocket_shorts/controller/versioning'

  ActionDispatch::Routing::Mapper.send :include, RocketShorts::Routing

  require 'rocket_shorts/railtie' if defined?(Rails::Railtie)


  mattr_accessor :header_format

  # self.header_format = /^application\/vnd\.example\.v/
end
