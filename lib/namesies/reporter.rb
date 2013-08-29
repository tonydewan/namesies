require 'colorize'

module Namesies
  class Reporter
    attr_accessor :title
    
    def initialize(title)
      @title = title
    end

    def result(result, color)
      color ||= 'white'
      puts "  #{@title}: " + result.send(color)
    end

    def recommendation(rec)
      puts "     " + rec
    end
  end
end