# This modifies RocketPants routing to use
# accept headers and namespaces instead of a :version parameter.
#
# (see RocketPants::Routing)
require 'rocket_pants/routing'

module RocketShorts
  module Routing

    # Scopes a set of given api routes, allowing for option versions.
    # @param [Hash] options options to pass through to the route e.g. `:module`.
    # @option options [Array<Integer>, Integer] :versions the versions to support
    # @option options [Array<Integer>, Integer] :version the single version to support
    # @raise [ArgumentError] raised when the version isn't provided.
    def rocket_pants(options = {}, &blk)
      versions = (Array(options.delete(:versions)) + Array(options.delete(:version))).flatten.map(&:to_s)
      versions.each do |version|
        raise ArgumentError, "Got invalid version: '#{version}'" unless version =~ /\A\d+\Z/
      end
      versions_regexp = /(#{versions.uniq.join("|")})/
      raise ArgumentError, 'please provide atleast one version' if versions.empty?
      options = options.deep_merge({
        constraints: RoutingConstraints.new(versions: versions_regexp, default: !!options.delete(:default)),
      })
      namespace :api, defaults: {format: 'json'} do
        scope options, &blk
      end
    end
    alias api rocket_pants

  end
end
