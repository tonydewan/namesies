require 'net/http'
require 'colorize'

module Namesies
  class Twitter

    def self.search(query)
      response = Net::HTTP.get_response(URI("https://twitter.com/#{query}"))
      puts "twitter:"
      case response.code
      when "404"
        puts "@#{query} available".green
      when "200"
        puts "@#{query} unavailable".red
      else
        puts "something's wrong with twitter :("
      end
    end

  end
end