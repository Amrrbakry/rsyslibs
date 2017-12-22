require 'rsyslibs/version'
require 'rsyslibs/request'
require 'rsyslibs/operating_system_info'
require 'bundler'
require 'rsyslibs/request'

module Rsyslibs
  class Dependencies
    class << self
      def system_dependencies
        payload = {
          project_dependencies: project_dependencies,
          os_info: os_info
        }
        api(:post, 'lookup_syslibs', payload)
      end

      def project_dependencies
        Bundler.definition.dependencies.map(&:name)
      end

      def os_info
        Rsyslibs::OperatingSystemInfo.os_info
      end

      def api(method, path, payload, headers = { content_type: 'application/json' })
        Rsyslibs::Request.api(method, path, payload, headers)
      end
    end
  end
end
