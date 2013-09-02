require 'colorize'

module Namesies
  class Reporter
    attr_accessor :title
    
    def initialize(title)
      @title = title
    end

    def result(result, color = nil)
      out = "  #{@title}: "

      if color
        out += result.send(color)
      else
        out += result
      end

      puts out
    end

    def recommendation(rec)
      puts "     " + rec
    end
  end
end