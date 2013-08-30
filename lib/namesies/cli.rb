require 'thor'

module Namesies
  class CLI < Thor

    option :only, type: :array, aliases: 'o'
    option :except, type: :array, aliases: 'e'
    desc "search QUERY", "search all services for QUERY"
    def search(q)
      puts "Searching for #{q}..."
      puts "\n"

      services = Namesies.constants - [:VERSION, :CLI, :Reporter]

      if options[:only]
        options[:only].each do |service|
          Namesies.const_get(service.capitalize).send(:search, q)
        end
      else
        services.each do |service|
          next if options[:except] && options[:except].include?(service.to_s.downcase)
          Namesies.const_get(service.capitalize).send(:search, q)
        end
      end

      puts "\n"
    end

    desc "services", "list all currently searchable services"
    def services
      puts "Namesies currently searches:"
      Namesies.constants.each do |service|
        puts "  #{service}" unless [:VERSION, :CLI, :Reporter].include? service
      end
    end
  end
end