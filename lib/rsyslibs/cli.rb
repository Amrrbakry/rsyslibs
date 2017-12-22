require 'thor'
require 'rsyslibs'

module Rsyslibs
  class CLI < Thor
    desc 'system_dependencies', 'Fetches all required system-level libraries for your project dependencies'
    def system_dependencies
      puts Rsyslibs::Dependencies.system_dependencies
    end

    desc 'print_friendly_syslibs', 'Fetches all required system-level libraries for your project dependencies
    and prints them in a formatted friendly way'
    def print_friendly_syslibs
      puts Rsyslibs::Dependencies.print_friendly_syslibs
    end

    desc 'install_syslibs', 'Fetches all required system-level libraries for your project dependencies
    and installs them.'
    def install_syslibs
      puts Rsyslibs::Dependencies.install_syslibs
    end
  end
end
