require 'json'
require 'net/http'

module Namesies
  class Domain

    def self.search(query)
      reporter = Namesies::Reporter.new('Domains')

      response = Net::HTTP.get(URI("https://domai.nr/api/json/search?q=#{query}"))
      results = JSON.parse(response)['results']
      available = results.map{|d| d if d['availability'] == "available" }.compact
      
      if available.any?
        reporter.result "#{available.length} related domains available", 'green'

        available.each do |domain|
          reporter.recommendation domain["domain"]
        end

      else
        reporter.result "0 related domains available", 'red'
      end

    end

  end
end