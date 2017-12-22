require 'rest-client'

module Rsyslibs
  class Request
    API_BASE_URL = 'https://rsyslibsapi.herokuapp.com'.freeze

    def self.api(method, path, payload, headers)
      url = "#{API_BASE_URL}#{path}"
      RestClient::Request.execute(method: method, url: url, payload: payload, headers: headers)
    end
  end
end
