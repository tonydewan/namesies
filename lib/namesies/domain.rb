require 'json'
require 'net/http'
require 'colorize'

module Namesies
  class Domain

    def self.search(query)
      response = Net::HTTP.get(URI("https://domai.nr/api/json/search?q=#{query}"))
      results = JSON.parse(response)['results']
      available = results.map{|d| d if d['availability'] == "available" }.compact

      puts "domains:"
      if available.any?
        puts "#{available.length} related domains available:".green
      
        available.each do |domain|
          puts "  -> " + domain["domain"]
        end
      else
        puts "0 related domains available".red
      end

    end

  end
end