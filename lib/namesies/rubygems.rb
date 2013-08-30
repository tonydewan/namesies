require 'gems'

module Namesies
  class Rubygems

    def self.search(query)
      reporter = Namesies::Reporter.new('RubyGems')
      gem_info = Gems.info query

      if gem_info.is_a? String
        reporter.result "No gem named #{query}", 'green'
      else
        reporter.result "gem named #{query} exists: - #{gem_info['homepage_uri']} (#{gem_info['downloads']} downloads)", 'red'
      end

    end

  end
end