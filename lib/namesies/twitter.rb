require 'net/http'

module Namesies
  class Twitter

    def self.search(query)
      reporter = Namesies::Reporter.new('Twitter')
      response = Net::HTTP.get_response(URI("https://twitter.com/#{query}"))

      case response.code
      when "404"
        reporter.result "@#{query} available", 'green'
      when "200"
        reporter.result "@#{query} unavailable", 'red'
      else
        reporter.result "something's wrong with twitter :("
      end
    end

  end
end