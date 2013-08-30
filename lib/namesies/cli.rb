require 'thor'

module Namesies
  class CLI < Thor

    desc "search QUERY", "search all services for QUERY"
    def search(q)
      puts "Searching for #{q}..."
      puts "\n"
      Namesies::Domain.search(q)
      Namesies::Twitter.search(q)
      Namesies::Trademark.search(q)
      Namesies::RubyGems.search(q)
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