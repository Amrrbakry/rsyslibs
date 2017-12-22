require 'rsyslibs/version'
require 'rsyslibs/operating_system_info'
require 'rsyslibs/request'
require 'bundler'
require 'json'

module Rsyslibs
  class Dependencies
    class << self
      def system_dependencies
        payload = {
          project_dependencies: project_dependencies,
          os_info: os_info
        }.to_json
        parse_response(api(:post, '/lookup_syslibs', payload))
      end

      def project_dependencies
        Bundler.definition.dependencies.map(&:name)
      end

      def print_friendly_syslibs
        res = JSON.parse(system_dependencies)
        return 'No libraries found.' if res.empty?

        puts "#{res.size} system libraries need to be installed..."
        puts ''
        res.each_with_index do |lib, index|
          project_dependencies = lib['project_dependencies'].collect { |v| v['name'] }.join(', ')
          puts "#{index + 1}- #{lib['name']} for gems (#{project_dependencies}) on operating system #{lib['os']}."
        end
      end

      private

      def parse_response(response)
        if response.code == 200
          response.body
        else
          'Request failed. Please try again.'
        end
      end

      def os_info
        Rsyslibs::OperatingSystemInfo.os_info
      end

      def api(method, path, payload, headers = { content_type: :json, accpet: :json })
        Rsyslibs::Request.api(method, path, payload, headers)
      end
    end
  end
end
