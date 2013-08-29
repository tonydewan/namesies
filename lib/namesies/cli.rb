require 'thor'

module Namesies
  class CLI < Thor

    desc "search QUERY", "search all services for QUERY"
    def search(q)
      puts "checking #{q}..."
      Namesies::Domain.search(q)
      Namesies::Twitter.search(q)
      Namesies::RubyGems.search(q)
      Namesies::Trademark.search(q)
    end

    desc "s QUERY", "alias for search QUERY"
    def s(q)
      search(q)
    end
  end
end