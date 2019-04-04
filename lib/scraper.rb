require 'open-uri'
require 'nokogiri'
require 'pry'
#require_relative './environment.rb'
require_relative './album.rb'

#newest_album_url = https://pitchfork.com/best/
#album_list_url = https://pitchfork.com/reviews/best/albums/

class Scraper

  def self.scrape_pitchfork(index_url)
      index = Nokogiri::HTML(open(index_url))
  end

  def self.newest_album
    new_album = scrape_pitchfork.css(".bnm-hero__review-block")[0]
  end

  def self.album_list
    a_list = scrape_pitchfork.css(".fragment-list").css(".review")[0,1,2...]
  end

end

#scrape_pitchfork('https://pitchfork.com/reviews/best/albums/')


#track = index.css(".bnm-hero__review-block")[1]
#reissue = index.css(".bnm-hero__review-block")[2].text
#album_link - index.css(".bnm-hero__review-block a").attr("href").value
