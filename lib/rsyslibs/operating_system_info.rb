require 'os'
require 'yaml'

module Rsyslibs
  class OperatingSystemInfo
    def self.os_info
      os_report = YAML.safe_load(OS.report)
      {
        os: os_report['target_os'],
        os_vendor: os_report['target_vendor'],
        os_bits: OS.bits,
        ruby_platform: os_report['RUBY_PLATFORM']
      }
    end

    def self.os_name
      return 'MacOS' if OS.mac?

      return 'Linux' if OS.linux?

      'Unknown OS'
    end
  end
end
