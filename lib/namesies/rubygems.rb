require 'gems'

module Namesies
  class RubyGems

    def self.search(query)
      gem_info = Gems.info query

      puts "rubygems:"
      if gem_info.is_a? String
        puts "No gem named #{query}".green
      else
        puts "gem named #{query} exists: - #{gem_info['homepage_uri']} (#{gem_info['downloads']} downloads)".red
      end

    end

  end
end