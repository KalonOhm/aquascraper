require 'pry'
require 'nokogiri'
require 'open-uri'

require_relative 'printable.rb'

class FishScraper 
  SCRAPE_URL = "https://en.wikipedia.org/wiki/List_of_"
  def self.scrape_freshwater
    scrape_url = SCRAPE_URL + "freshwater_aquarium_fish_species"
    doc = Nokogiri::HTML(URI.open(scrape_url))
    # doc.css('table tbody tr') - works
    # doc.css('table[class="wikitable sortable jquery-tablesorter"] tr') - [] nothing 
    # chatGPT suggested doc.css('table.wikitable.sortable') - works

    # table = doc.css('table.wikitable.sortable')
    # row = table.css('tr')
    # rows.each do |row|
    #    next if row.css('th').any?
    #    columns = row.css('td')
    #    if columns[0].text.strip != ''
    #      puts columns[0].text.strip
    #    end  
    #  end  
    # this will print out individually every single fish in the list. I checked first and last, and they matched up. That it's quite what I was going for though. 
    
      fish_rows = doc.css('table.wikitable.sortable tbody tr')
     row_count = fish_rows.count
     binding.pry
      fish_rows[1..row_count].each do |fish_row|
        # skip headers (th)
        next if fish_row.css('th').any?
        cell = fish_row.css('td')

        common_name = cell[0].text
        taxonomic_name = cell[1].text
        image_url = "https:" + cell[2].css('img').first['src']
        # somehow need to remove first 2 // only
        size = cell[3].text.split[1]
        # need to remove "()" and possibly in
        other_remarks = cell[4].text
        # need to remove \n chars.
     end
    
  end

  def self.scrape_brackish_water
    scrape_url = SCRAPE_URL + "brackish_aquarium_fish_species"

    doc = Nokogiri::HTML(URI.open(scrape_url)) 
    
    fish_rows = doc.css('table.sortable.collapsible tbody tr')
     row_count = fish_rows.count
     binding.pry
      fish_rows[1..row_count].each do |fish_row|
        # skip headers (th)
        next if fish_row.css('th').any?
        cell = fish_row.css('td')
        
        common_name = cell[0].text
        taxonomic_name = cell[1].text
        image_url = "https:" + cell[2].css('img').first['src']
        # somehow need to remove first 2 // only
        size = cell[3].text.split[1]
        # need to remove "()" and possibly in
        other_remarks = cell[4].text
        # need to remove \n chars.
      end


  end
  
  def self.scrape_saltwater
    scrape_url = SCRAPE_URL + "marine_aquarium_fish_species"

    doc = Nokogiri::HTML(URI.open(scrape_url))


    fish_rows = doc.css('table.sortable.collapsible tbody tr')
     row_count = fish_rows.count
     binding.pry
      fish_rows[1..row_count].each do |fish_row|
        # skip headers (th)
        next if fish_row.css('th').any?
        cell = fish_row.css('td')
        
        common_name = cell[0].text
        taxonomic_name = cell[2].text
        image_url = "https:" + cell[1].css('img').first['src']
        # somehow need to remove first 2 // only
        size = cell[5].text.split[1]
        # need to remove "()" and possibly in
        other_remarks = cell[4].text
        # need to remove \n chars.


    end
  end

  binding.pry
end
