require 'rsyslibs/version'
require 'bundler'

module Rsyslibs
  class Dependencies
    def self.system_dependencies
      # get project_dependencies
      # get os info
      # make an api call with dependencies and os info
      # parse the response and return it
    end

    private

    def project_dependencies
      Bundler.definition.dependencies.each(&:name)
    end
  end
end
