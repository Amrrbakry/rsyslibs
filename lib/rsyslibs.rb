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
        syslibs = JSON.parse(system_dependencies)
        return 'No libraries found.' if syslibs.empty?

        puts "#{syslibs.size} system libraries found..."
        puts ''
        syslibs.each_with_index do |lib, index|
          project_dependencies = lib['project_dependencies'].collect { |v| v['name'] }.join(', ')
          puts "#{index + 1}- #{lib['name']} for gems (#{project_dependencies}) on operating system #{lib['os']}."
        end
        puts ''
        puts "Run 'sudo apt-get install LIBRARY NAME' to install on Ubuntu and Debian-based distros."
        puts "Run 'brew install LIBRARY NAME' to install on macOS."
        syslibs
      end

      def install_syslibs
        syslibs = JSON.parse(system_dependencies)
        return 'No libraries found.' if syslibs.empty?

        os_name = Rsyslibs::OperatingSystemInfo.os_name
        case os_name
        when 'MacOS' then syslibs.each { |lib| `brew install #{lib['name']}` }
        when 'Linux' then syslibs.each { |lib| `apt-get install #{lib['name']}` }
        else "I don't know how to install these libraries on this operating system :("
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
