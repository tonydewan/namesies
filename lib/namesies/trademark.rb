require 'mechanize'

module Namesies
  class Trademark

    def self.search(query)
      reporter = Namesies::Reporter.new('Trademark')
      agent = Mechanize.new
      agent.user_agent_alias = 'Mac Safari'

      page = agent.get('http://www.uspto.gov/trademarks/')
      page = agent.page.links.find{ |l| l.text.match /TESS/ }.click
      page = agent.page.link_with(:text => 'Basic Word Mark Search (New User)').click

      form = page.form('search_text')
      form.p_s_PARA2 = query
      form.radiobutton_with(:value => /live/).check
      form.fields.delete_at(10)

      page = form.submit

      if page.body.include? 'No TESS records were found'
        reporter.result "No trademarks match #{query}", "green"
      elsif page.body.include? 'Record 1 out of 1'
        reporter.result "1 related live trademark found", "red"
      else
        result_count = page.body.match(/docs: (\d+) occ: (\d+)/)[1]
        reporter.result "#{result_count} related live trademarks found", "red"
      end

    end

  end
end