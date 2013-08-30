require 'thor'

module Namesies
  class CLI < Thor

    option :only, type: :array, aliases: 'o'
    option :except, type: :array, aliases: 'e'
    desc "search QUERY", "search all services for QUERY"
    def search(q)
      puts "Searching for #{q}..."
      puts "\n"
      if options[:only]
        options[:only].each do |service|
          Namesies.const_get(service.capitalize).send(:search, q)
        end
      else
        Namesies::Domain.search(q) unless options[:except].include? 'domain'
        Namesies::Twitter.search(q) unless options[:except].include? 'twitter'
        Namesies::Trademark.search(q) unless options[:except].include? 'trademark'
        Namesies::Rubygems.search(q) unless options[:except].include? 'rubygems'
      end

      puts "\n"
    end

    desc "services", "list all currently searchable services"
    def services
      puts "Namesies currently searches:"
      Namesies.constants.each do |service|
        puts "  #{service}" unless [:VERSION, :CLI].include? service
      end
    end
  end
end