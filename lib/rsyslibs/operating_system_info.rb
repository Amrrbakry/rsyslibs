require 'os'
require 'yaml'

module Rsyslibs
  class OperatingSystemInfo
    def self.os_info
      os_report = YAML.safe_load(OS.report)
      {
        os_name: os_report['target_os'],
        vendor: os_report['target_vendor'],
        bits: OS.bits,
        ruby_platform: os_report['RUBY_PLATFORM']
      }
    end
  end
end
