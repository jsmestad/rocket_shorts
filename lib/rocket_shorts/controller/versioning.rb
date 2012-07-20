module RocketShorts
  module Versioning
    extend ActiveSupport::Concern

    included do
      class_attribute :_version_range
    end

    module ClassMethods

      def version(version)
        version = version..version if version.is_a?(Integer)
        self._version_range = version
        before_filter :verify_api_version
      end

    end

    protected

    def version
      if !instance_variable_defined?(:@version)
        @version = begin
          header = request.headers['Accept'].match(/#{RocketShorts.header_format}(\d+?)/)
          version = header[1] rescue nil
          version.present? && Integer(version)
        rescue ArgumentError
          nil
        end
      end
      @version
    end

    def verify_api_version
      error! :invalid_version if version.present? && !_version_range.include?(version)
    end
  end
end
